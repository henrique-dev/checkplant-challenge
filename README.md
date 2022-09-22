## Desafio Checkplant

### Problema do miojo

João é um fanático por miojos; ele os adora, e, como era de se esperar, ele levou vários pacotes quando foi acampar com seus colegas. Como João só gosta de miojos feitos com o tempo exato, ele se desesperou ao perceber que havia esquecido seu relógio em casa. Por sorte, ele conseguiu, no caminho, comprar duas ampulhetas de durações diferentes. Por exemplo, se o miojo precisa de 3 minutos para ficar pronto, e João tiver uma ampulheta de 5 minutos e outra de 7, uma possível forma de cozinhar o miojo é:

- João começa virando as duas ampulhetas ao mesmo tempo.
- Quando a areia da ampulheta de 5 minutos se esgotar, João torna a virá-la.
- João começa a preparar o miojo quando a areia da ampulheta de 7 minutos acabar.
- João tira o miojo do fogo quando a ampulheta de 5 minutos acabar novamente.
- Dessa forma, o miojo ficará 3 minutos no fogo (do minuto 7 ao minuto 10). Assim, apesar do miojo levar apenas três minutos para ser cozido, ele precisa de 10 minutos para ficar pronto.

Faça um programa que, dado o tempo de preparo do miojo, e os tempos das duas ampulhetas (ambos maiores que o tempo do miojo), determina o tempo mínimo necessário para o miojo ficar pronto ou se não é possível cozinhar o miojo no tempo exato com as ampulhetas disponíveis.

### Distância entre Pontos

Esse é mais simples, a ideia é criar um programa que recebe N pontos (latitude e longitude) e retorna a distância entre eles, ou seja a distância do primeiro ponto para todos os outros pontos, do segundo ponto para todos os outros pontos...e assim por diante...

## Rodando (Com docker ou local)
Passos para rodar os testes aplicados nos desafios:

## Com docker
### Requerimentos
- docker
- docker-composer

### Como rodar:
```
docker-compose build
docker-compose run app rspec
```

Saída:
```ruby
......

Finished in 0.00768 seconds (files took 0.16301 seconds to load)
6 examples, 0 failures
```

## Local
### Requerimentos
- ruby
- rspec

### Como rodar:
```
cd checkplant-challenge
rspec
```

Saída:
```ruby
......

Finished in 0.00768 seconds (files took 0.16301 seconds to load)
6 examples, 0 failures
```

## Para incluir mais testes

### Problema do miojo

Editar o arquivo `checkplant-challenge/spec/challenges/ramen_time_service_spec.rb`, e acrescentar um novo contexto ao final do arquivo:
```ruby
...
context 'novo contexto' do
  let(:preparation_time) { 3 } # tempo de preparação do miojo
  let(:first_hourglass_time) { 2 } # tempo da primeira ampulheta
  let(:second_hourglass_time) { 7 } # tempo da segunda ampulheta

  let!(:service_response) { RamenTime.new(**params).call }

  it 'retorno esperado' do
    # se não for possivel fazer o miojo incluir descomentar as linhas abaixo
    # expect(service_response[:time]).to be_nil
    # expect(service_response[:message]).to eq('The hourglass time must be longer than the ramen preparation time')

    # se for possivel fazer o miojo descomentar as linhas abaixo
    # expect(service_response[:time]).to eq(10) # acrescentar o tempo total de preparo do miojo
    # expect(service_response[:message]).to eq('It is possible to cook in exact time')
  end
end
...
```

### Distância entre Pontos
Editar o arquivo `checkplant-challenge/spec/challenges/distance_between_points_service_spec.rb`, e acrescentar um novo contexto ao final do arquivo:
```ruby
...
context 'novo contexto' do

  # incluir abaixo os pontos com respectivos valores de X e Y
  let(:params) { {points: [
    {x: 0, y: 0},
    {x: 0, y: 5},
    {x: 3, y: 5},
    {x: 4, y: -3}

  ]} }
  let!(:service_response) { DistanceBetweenPoints.new(**params).call }

  # acrescentar abaixo os retornos esperados, onde para n pontos inseridos haverá o retorno de (n-1)*n. Para cada linha x1 e y1 equivalem ao ponto A de comparação, x2 e y2 ao ponto B de comparação e distance a distancia entre os dois pontos (sendo essa cortada em 5 casas decimais após a virgula para facilitar os testes)
  it 'retorno esperado' do
    expect(service_response).to eq(
      [
        {x1: 0, y1: 0, x2: 0, y2: 5, distance: 5.0},
        {x1: 0, y1: 0, x2: 3, y2: 5, distance: 5.83095},
        {x1: 0, y1: 0, x2: 4, y2: -3, distance: 5.0},

        {x1: 0, y1: 5, x2: 0, y2: 0, distance: 5.0},
        {x1: 0, y1: 5, x2: 3, y2: 5, distance: 3.0},
        {x1: 0, y1: 5, x2: 4, y2: -3, distance: 8.94427},

        {x1: 3, y1: 5, x2: 0, y2: 0, distance: 5.83095},
        {x1: 3, y1: 5, x2: 0, y2: 5, distance: 3.0},
        {x1: 3, y1: 5, x2: 4, y2: -3, distance: 8.06226},

        {x1: 4, y1: -3, x2: 0, y2: 0, distance: 5.0},
        {x1: 4, y1: -3, x2: 0, y2: 5, distance: 8.94427},
        {x1: 4, y1: -3, x2: 3, y2: 5, distance: 8.06226}
      ]
    )
  end
end
...
```
