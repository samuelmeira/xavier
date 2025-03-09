# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Xavier.Repo.insert!(%Xavier.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Xavier.Repo

categories = [
  "Mangá",
  "Drama",
  "Ficção Científica",
  "Fantasia",
  "Biografia",
  "Administração e Negócios",
  "Romance",
  "Suspense",
  "Esportes e Lazer",
  "Música",
  "Botânica",
  "Fotografia",
  "Economia",
  "Moda"
]

Enum.each(categories, &Xavier.Repo.insert!(%Xavier.Catalog.Category{name: &1}))

Repo.insert(%Xavier.Catalog.Volume{
  title: "Jujutsu Kaisen Volume 0",
  synopsis:
    "O estudante colegial Yuuta Okkotsu deseja ser executado porque sofre com as ações de Rika Orimoto, espírito rancoroso que o possuiu. Enquanto isso, Satoru Gojou, professor que ensina a exorcizar 'maldições' transfere Yuuta para a Escola Técnica Superior de Jujutsu de Tokyo. Tem início a pré-sequência da série Jujutsu Kaisen!",
  cover: "https://m.media-amazon.com/images/I/71sicR3ldaL._SL1459_.jpg",
  price: 3590,
  author: "Gege Akutami"
})

Repo.insert(%Xavier.Catalog.Volume{
  title: "Jujutsu Kaisen Volume 1",
  synopsis:
    "Apesar do estudante colegial Yuuji Itadori ter grande força física, ele se inscreve no Clube de Ocultismo. Certo dia, eles encontram um 'objeto amaldiçoado' e retiram o selo, atraindo criaturas chamadas de 'maldições'. Itadori corre em socorro de seus colegas, mas será que ele será capaz de abater essas criaturas usando apenas a força física?! Na compra da primeira edição de Jujutsu ganhe de brinde um Poster Exclusivo",
  cover: "https://m.media-amazon.com/images/I/71PBZJaSmAL._AC_UF1000,1000_QL80_.jpg",
  price: 3590,
  author: "Gege Akutami"
})

Repo.insert(%Xavier.Catalog.Volume{
  title: "Jujutsu Kaisen Volume 2",
  synopsis:
    "Um útero amaldiçoado surge repentinamente em um reformatório. Itadori e seus colegas do primeiro ano foram designados para salvar as pessoas que não conseguiram fugir do edifício! Mas o grupo depara-se com uma situação desesperadora: o útero se transformou em um espírito amaldiçoado de nível especial. Itadori tenta revidar, trocando de corpo com Sukuna, mas será que o plano vai dar certo?!",
  cover: "https://m.media-amazon.com/images/I/91MAequ2koL._SL1500_.jpg",
  price: 3590,
  author: "Gege Akutami"
})

Repo.insert(%Xavier.Catalog.Volume{
  title: "Jujutsu Kaisen Volume 3",
  synopsis:
    "Aoi Toudou e Mai Zenin, da Escola Técnica Superior de Jujutsu de Kyoto, aparecem diante de Fushiguro e Kugisaki! O que Fushiguro respondeu para Toudou, quando questionado sobre o tipo de garota que ele gosta? Enquanto isso, Itadori é enviado para o local em que um espírito amaldiçoado provocou um incidente, fazendo com que o feiticeiro treine suas habilidades na prática!",
  cover: "https://m.media-amazon.com/images/I/51whdHRS4LL._SY445_SX342_.jpg",
  price: 3590,
  author: "Gege Akutami"
})

Repo.insert(%Xavier.Catalog.Volume{
  title: "Jujutsu Kaisen Volume 4",
  synopsis:
    "Itadori investiga os assassinatos causados por uma maldição e acaba conhecendo Junpei, um garoto que é fascinado por Mahito, o responsável pelas mortes. Qual será a reação de Itadori ao ver o novo amigo transformado em fantoche da maldição?",
  cover: "https://m.media-amazon.com/images/I/71VS-OuXOjL._SL1459_.jpg",
  price: 3590,
  author: "Gege Akutami"
})

Repo.insert(%Xavier.Catalog.Volume{
  title: "Jujutsu Kaisen Volume 5",
  synopsis:
    "Tem início o Intercâmbio da Escola Irmã de Kyoto. O primeiro dia do torneio em equipe terá como vencedor o grupo que exorcizar primeiro uma maldição de nível 2, mas o briguento Todou ataca de surpresa o grupo da Escola de Tokyo, e Itadori recebe a tarefa de enfrentá-lo. O que ele não esperava é que o restante da equipe da Escola de Kyoto apareceria para se juntar ao confronto!!",
  cover: "https://m.media-amazon.com/images/I/71c-+BcZ-eL._SL1459_.jpg",
  price: 3590,
  author: "Gege Akutami"
})
