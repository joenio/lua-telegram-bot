--[[
grampo.lua
http://telegram.me/grampobot
# apt-get install lua5.2 lua-sec
]]

transcripts = {
  -- http://oglobo.globo.com/brasil/para-sarney-delacao-da-odebrecht-seria-metralhadora-ponto-100-diz-jornal-19377608
  {SARNEY = "Olha, o homem está no exterior. Então a família dele ficou de me dizer quando é que ele voltava. E não falei ontem porque não me falou de novo. Não voltou. Tá com dona Magda. E eu falei com o secretário."},
  {MACHADO = "Eu vou tentar falar, que o meu irmão é muito amigo da Magda, para saber se ele sabe quando é que ela volta. Se ele me dá uma saída."},
  {MACHADO= "Presidente, então tem três saídas para a presidente Dilma, a mais inteligente..."},
  {SARNEY = "Não tem nenhuma saída para ela."},
  {MACHADO = "...ela pedir licença."},
  {SARNEY = "Nenhuma saída para ela. Eles não aceitam nem parlamentarismo com ela."},
  {MACHADO = "Tem que ser muito rápido."},
  {SARNEY = "E vai, está marchando para ser muito rápido."},
  {MACHADO = "Que as delações são as que vem, vem às pencas, não é?"},
  {SARNEY = "Odebrecht vem com uma metralhadora de ponto 100."},
  {MACHADO = "Olha, acabei de sair da casa do nosso amigo. Expliquei tudo a ele [Renan Calheiros], em todos os detalhes, ele acha que é urgente, tem que marcar uma conversa entre o senhor, o Romero e ele. E pode ser aqui... Só não pode ser na casa dele, porque entra muita gente. Onde o senhor acha melhor?"},
  {SARNEY = "Aqui."},
  {MACHADO = "É. O senhor diz a hora, que qualquer hora ele está disponível, quando puder avisar o Romero, eu venho também. Ele [Renan] ficou muito preocupado. O sr. viu o que o [blog do] Camarotti botou ontem?"},
  {SARNEY = "Não."},
  {MACHADO = "Alguém que vazou, provavelmente grande aliado dele, diz que na reunião com o PSDB ele teria dito que está com medo de ser preso, podia ser preso a qualquer momento."},
  {SARNEY = "Ele?"},
  {MACHADO = "Ele, Renan. E o Camarotti botou. Na semana passada, não sei se o senhor viu, numa quinta ou sexta, um jornalista aí, que tem certa repercussão na área política, colocou que o Renan tinha saído às pressas daqui com medo dessa condição, delações, e que estavam sendo montadas quatro operações da Polícia Federal, duas no Nordeste e duas aqui. E que o Teori estava de plantão... Desculpe, presidente, não foi quinta não. Foi sábado ou domingo. E que o Teori estava de plantão com toda sua equipe lá no Ministério e que isso significaria uma operação... Isso foi uma... operação que iria acontecer em dois Estados do Nordeste e dois no sul. Presidente, ou bota um basta nisso... O Moro falando besteira, o outro falando isso. [inaudível] 'Renan, tu tem trinta dias que a bola está perto de você, está quase no seu colo'. Vamos fazer uma estratégia de aproveitar porque acabou. A gente pode tentar, como o Brasil sempre conseguiu, uma solução não sangrenta. Mas se passar do tempo ela vai ser sangrenta. Porque o Lula, por mais fraco que esteja, ele ainda tem... E um longo processo de impeachment é uma loucura. E ela perdeu toda... [...] Como é que a presidente, numa crise desse tamanho, a presidente está sem um ministro da Justiça? E não tem um plano B, uma alternativa. Esse governo acabou, acabou, acabou. Agora, se a gente não agir... Outra coisa que é importante para a gente, e eu tenho a informação, é que para o PSDB a água bateu aqui também. Eles sabem que são a próxima bola da vez."},
  {SARNEY = "Eles sabem que eles não vão se safar."},
  {MACHADO = "E não tinham essa consciência. Eles achavam que iam botar tudo mundo de bandeja... Então é o momento dela para se tentar conseguir uma solução a la Brasil, como a gente sempre conseguiu, das crises. E o senhor é um mestre pra isso. Desses aí o senhor é o que tem a melhor cabeça. Tem que construir uma solução. Michel tem que ir para um governo grande, de salvação nacional, de integração e etc etc etc."},
  {SARNEY = "Nem Michel eles queriam, eles querem, a oposição. Aceitam o parlamentarismo. Nem Michel eles queriam. Depois de uma conversa do Renan muito longa com eles, eles admitiram, diante de certas condições."},
  {MACHADO = "Não tem outa alternativa. Eles vão ser os próximos. Presidente: não há quem resista a Odebrecht."},
  {SARNEY = "Mas para ver como é que o pessoal..."},
  {MACHADO = "Tá todo mundo se cagando, presidente. Todo mundo se cagando. Então ou a gente age rápido. O erro da presidente foi deixar essa coisa andar. Essa coisa andou muito. Aí vai toda a classe política para o saco. Não pode ter eleição agora."},
  {SARNEY = "Mas não se movimente nada, de fazer, nada, para não se lembrarem..."},
  {MACHADO = "É, eu preciso ter uma garantia"},
  {SARNEY = "Não pensar com aquela coisa apress... O tempo é a seu favor. Aquele negócio que você disse ontem é muito procedente. Não deixar você voltar para lá [Curitiba]"},
  {MACHADO = "Só isso que eu quero, não quero outra coisa."},
  {SARNEY = "Agora, não fala isso."},
  {MACHADO = "Vou dizer pro senhor uma coisa. Esse cara, esse Janot que é mau caráter, ele disse, está tentando seduzir meus advogados, de eu falar. Ou se não falar, vai botar para baixo. Essa é a ameaça, presidente. Então tem que encontrar uma... Esse cara é muito mau caráter. E a crise, o tempo é a nosso favor."},
  {SARNEY = "O tempo é a nosso favor."},
  {MACHADO = "Por causa da crise, se a gente souber administrar. Nosso amigo, soube ontem, teve reunião com 50 pessoas, não é assim que vai resolver crise política. Hoje, presidente, se estivéssemos só nos três com ele, dizia as coisas a ele. Porque não é se reunindo 50 pessoas, chamar ministros.. Porque a saída que tem, presidente, é essa que o senhor falou é isso, só tem essa, parlamentarismo. Assegurando a ela e o Lula que não vão ser... Ninguém vai fazer caça a nada. Fazer um grande acordo com o Supremo, etc, e fazer, a bala de Caxias, para o país não explodir. E todo mundo fazer acordo porque está todo mundo se fodendo, não sobra ninguém. Agora, isso tem que ser feito rápido. Porque senão esse pessoal toma o poder... Essa cagada do Ministério Público de São Paulo nos ajudou muito."},
  {SARNEY = "Muito."},
  {MACHADO = "Muito, muito, muito. Porque bota mais gente, que começa a entender... O Janio de Freitas já está na oposição, radicalmente, já está falando até em Operação Bandeirante. A coisa começou... O Moro começou a levar umas porradas, não sei o quê. A gente tem que aproveitar ess... Aquele negócio do crime do político [de inação]: nós temos 30 dias, presidente, para nós administrarmos. Depois de 30 dias, alguém vai administrar, mas não será mais nós. O nosso amigo tem 30 dias. Ele tem sorte. Com o medo do PSDB, acabou com ele, no colo dele, uma chance de poder ser ator desse processo. E o senhor, presidente, o senhor tem que entrar com a inteligência que não tem. E experiência que não tem. Como é que você faz reunião com o Lula com 50 pessoas, como é que vai querer resolver crise, que vaza tudo..."},
  {SARNEY = "Eu ontem disse a um deles que veio aqui. Eu disse: 'Olhe, esqueçam qualquer solução convencional. Esqueçam!'."},
  {MACHADO = "Não existe, presidente."},
  {SARNEY = "'Esqueçam, esqueçam!'"},
  {MACHADO = "Eu soube que o senhor teve uma conversa com o Michel."},
  {SARNEY = "Eu tive. Ele está consciente disso. Pelo menos não é ele que..."},
  {MACHADO = "Temos que fazer um governo, presidente, de união nacional."},
  {SARNEY = "Sim, tudo isso está na cabeça dele, tudo isso ele já sabe, tudo isso ele já sabe. Agora, nós temos é que fazer o nosso negócio e ver como é que está o teu advogado, até onde eles falando com ele em delação premiada."},
  {MACHADO = "Não estão falando."},
  {SARNEY = "Até falando isso para saber até onde ele vai, onde é mentira e onde é valorização dele."},
  {MACHADO = "Não é valoriz... Essa história é verdadeira, e não é o advogado querendo, e não é diretamente. É [a PGR] dizendo como uma oportunidade, porque 'como não encontrou nada...' É nessa."},
  {SARNEY = "Sim, mas nós temos é que conseguir isso. Sem meter advogado no meio."},
  {MACHADO = "Não, advogado não pode participar disso, eu nem quero conversa com advogado. Eu não quero advogado nesse momento, não quero advogado nessa conversa."},
  {SARNEY = "Sem meter advogado, sem meter advogado, sem meter advogado."},
  {MACHADO = "De jeito nenhum. Advogado é perigoso."},
  {SARNEY = "É, ele quer ganhar..."},
  {MACHADO = "Ele quer ganhar e é perigoso. Presidente, não são confiáveis, presidente, você tá doido? Eu acho que o senhor podia convidar, marcar a hora que o senhor quer, e o senhor convidava o Renan e Romero e me diz a hora que eu venho. Qual a hora que o senhor acha melhor para o senhor?"},
  {SARNEY = "Eu vou falar, já liguei para o Renan, ele estava deitado."},
  {MACHADO = "Não, ele estava acordado, acabei de sair de lá agora."},
  {SARNEY = "Ele ligou para mim de lá, depois que tinha acordado, e disse que ele vinha aqui. Disse que vinha aqui."},
  {MACHADO = "Ele disse para o senhor marcar a hora que quiser. Então como faz, o senhor combina e me avisa?"},
  {SARNEY = "Eu combino e aviso."},
  {MACHADO = "O Moreira [Franco] está achando o quê?"},
  {SARNEY = "O Moreira também tá achando que está tudo perdido, agora, não tem gente com densidade para... [inaudível]"},
  {MACHADO = "Presidente, só tem o senhor, presidente. Que já viveu muito. Que tem inteligência. Não pode ser mais oba-oba, não pode ser mais conversa de bar. Tem que ser conversa de Estado-Maior. Estado-Maior analisando. E não pode ser um [...] que não resolve. Você tem que criar o núcleo duro, resolver no núcleo duro e depois ir espalhando e ter a soluç... Agora, foi nos dada a chave, que é o medo da oposição."},
  {SARNEY = "É, nós estamos... Duas coisas estão correndo paralelo. Uma é essa que nos interessa. E outra é essa outra que nós não temos a chave de dirigir. Essa outra é muito maior. Então eu quero ver se eu... Se essa chave... A gente tendo..."},
  {MACHADO = "Eu vou tentar saber, falar com meu irmão se ele sabe quando é que ela volta."},
  {SARNEY = "E veja com o advogado a situação. A situação onde é que eles estão mexendo para baixar o processo."},
  {MACHADO = "Baixar o processo, são duas coisas [suspeitas]: como essas duas coisas, Ricardo, que não tem nada a ver com Renan, e os 500, que não tem nada a ver com o Renan, eles querem me apartar do Renan..."},
  {SARNEY = "Eles quem?"},
  {MACHADO = "O Janot e a sua turma. E aí me botar pro Moro, que tem pouco sentido ficar aqui. Com outro objetivo."},
  {SARNEY = "Aí é mais difícil, porque se eles não encontraram nada, nem no Renan nem no negócio, não há motivo para lhe mandar para o Paraná."},
  {MACHADO = "Ele acha que essas duas coisas são motivo para me investigar no Paraná. Esse é o argumento. Na verdade o que eles querem é outra coisa, o pretexto é esse. Você pede ao [inaudível] para me ligar então?"},
  {SARNEY = "Peço. Na hora que o Renan marcar, eu peço... Vai ser de noite."},
  {MACHADO = "Tá. E o Romero também está aguardando, se o senhor achar conveniente."},
  {SARNEY = "[sussurrando] Não acho conveniente."},
  {MACHADO = "Não? O senhor que dá o tom."},
  {SARNEY = "Não acho conveniente. A gente não põe muita gente."},
  {MACHADO = "O senhor é o meu guia."},
  {SARNEY = "O Amaral Peixoto dizia isso: 'duas pessoas já é reunião. Três é comício'."},
  {MACHADO = "[rindo]"},
  {SARNEY = "Então três pessoas já é comício."},
  {SARNEY = "Agora é coisa séria, acho que o negócio é sério."},
  {MACHADO = "Presidente, o cara [Sérgio Moro] agora seguiu aquela estratégia, de 'deslegitimizar' as coisas, agora não tem ninguém mais legítimo para falar mais nada. Pegou Renan, pegou o Eduardo, desmoralizou o Lula. Agora a Dilma. E o Supremo fez essa suprema... rasgou a Constituição."},
  {SARNEY = "Foi. Fez aquele negócio com o Delcídio. E pior foi o Senado se acovardar de uma maneira... [autorizou prisão do então senador]."},
  {MACHADO = "O Senado não podia ter aceito aquilo, não."},
  {SARNEY = "Não podia, a partir dali ele acabou. Aquilo é uma página negra do Senado."},
  {MACHADO = "Porque não foi flagrante delito. Você tem que obedecer a lei."},
  {SARNEY = "Não tinha nem inquérito!"},
  {MACHADO = "Não tem nada. Ali foi um fígado dos ministros. Lascaram com o André Esteves.. Agora pergunta, quem é que vai reagir?"},
  {MACHADO = "O Senado deixar o Delcídio preso por um artista."},
  {SARNEY = "Uma cilada."},
  {MACHADO = "Cilada."},
  {SARNEY = "Que botaram eles. Uma coisa que o Senado se desmoralizou. E agora o Teori acabou de desmoralizar o Senado porque mostrou que tem mais coragem que o Senado, manda soltar."},
  {MACHADO = "Presidente, ficou muito mal. A classe política está acabada. É um salve-se quem puder. Nessa coisa de navio que todo mundo quer fugir, morre todo mundo."},
  {SARNEY = "Eu soube que o Lula disse, outro dia, ele tem chorado muito. [...] Ele está com os olhos inchados."},
  {SARNEY = "Nesse caso, ao que eu sei, o único em que ela está envolvida diretamente é que ela falou com o pessoal da Odebrecht para dar para campanha do... E responsabilizar aquele [inaudível]"},
  {MACHADO = "Isso é muito estranho [problemas de governo]. Presidente, você pegar um marqueteiro, dos três do Brasil. [...] Deixa aquele ministério da Justiça que é banana, só diz besteira. Nunca vi um governo tão fraco, tão frágil e tão omisso. Tem que alguém dizer assim 'A presidente é bunda mole'. Não tem um fato positivo."},
  {SARNEY = "E o Renan cometeu uma ingenuidade. No dia que ele chegou, quem deu isso pela primeira vez foi a Délis Ortiz. Eu cheguei lá era umas 4 horas, era um sábado, ele disse 'já entreguei todos os documentos para a Delis Ortiz, provando que eu... que foi dinheiro meu'. Eu disse: 'Renan, para jornalista você não dá documento nunca. Você fazer um negócio desse. O que isso vai te trazer de dor de cabeça'. Não deu outra."},
  {MACHADO = "Renan erra muito no varejo. Ele é bom. [...] Presidente, não pode ser assim, varejista desse jeito."},
  {SARNEY = "Tudo isso é o governo, meu Deus. Esse negócio da Petrobras só os empresários que vão pagar, os políticos? E o governo que fez isso tudo, hein?"},
  {MACHADO = "Acabou o Lula, presidente."},
  {SARNEY = "O Lula acabou, o Lula coitado deve estar numa depressão."},
  {MACHADO = "Não houve nenhuma solidariedade da parte dela."},
  {SARNEY = "Nenhuma, nenhuma. E com esse Moro perseguindo por besteira."},
  {MACHADO = "Tomou conta do Brasil. O Supremo fez a pedido dele."},
}

-- pass token as command line argument or insert it into code
local token = "185470150:AAH99r53_7w0fccHZj7Ga1eO9rFE1nv5FKk"

-- create and configure new bot with set token
local bot, extension = require("lua-bot-api").configure(token)

function message_to_me(msg)
  exit_words = {'saia', 'vaza', 'partiu', 'sair', 'licença', 'xô'}
  for index, word in pairs(exit_words) do
    if string.match(msg.text, word) then
      bot.sendMessage(msg.chat.id, "tchau querida(o)")
      bot.leaveChat(msg.chat.id)
    end
  end
end

-- override onMessageReceive function so it does what we want
extension.onTextReceive = function (msg)
	print("New Message by " .. msg.from.first_name)

  if (string.match(msg.text, '^@' .. bot.username .. ' ')) then
    message_to_me(msg)
  else
    words = {'grampo', 'delacao', 'golpe', 'sarney', 'machado', 'impitima'}
    for index, word in pairs(words) do
      if (string.match(string.lower(msg.text), word)) then
        math.randomseed(os.time())
        random = math.random(table.maxn(transcripts))
        name, say = next(transcripts[random])
        bot.sendMessage(msg.chat.id, name .. ': ' .. say)
        return
      end
    end
  end
end

-- This runs the internal update and callback handler
-- you can even override run()
extension.run()
