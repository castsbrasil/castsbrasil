# CastsBrasil

Esse é o código fonte do site [CastsBrasil](http://www.castsbrasil.com).
CastsBrasil tem como objetivo apresentar screencasts colaborativos de qualidade, sem nenhuma forma de cobrança, apenas com o intuito de difundir a linguagem na comunidade brasileira e facilitar o estudo de iniciantes, intermediários e até mesmo profissionais com casts totalmente em Português.

## Configuração Inicial

Esse projeto está sendo desenvolvido usando Ruby 2.3.1. Se você estiver utilizando [rvm](http://rvm.beginrescueend.com/)
ou [rbenv](https://github.com/sstephenson/rbenv) ele vai selecionar a versão exata em desenvolvimento
especificada no arquivo [.ruby-version](https://github.com/RubyCastsBrasil/RubyCastsBrasil/blob/master/.ruby-version).

- Crie um arquivo de configuração do banco de dados:
```shell
cp config/database.example.yml config/database.yml
```
- Execute o comando `rake db:migrate` para criar todas as tabelas no seu banco de dados.
- Execute o comando `RAILS_ENV=test rake db:migrate` para criar todas as tabelas no seu banco de dados de teste.
- Execute o comando `rails s` para subir o servidor [rails](https://github.com/rails/rails)

## Configuração inicial com Docker

Você utilizar o Docker para desenvolver e colaborar com o projeto, para isso siga os passos abaixo:

*Requerimentos*

- Docker 1.12+
- Docker Compose

*Setup*

- Build:
```shell
docker-compose build
```
-Crie um arquivo de configuração do banco de dados:
```shell
cp config/database.example.yml config/database.yml
```

*Desenvolvimento*

- Acesso ao container para desenvolvimento
```shell
docker-compose run --rm web bash
```

*Servidor*

- Execute o comando abaixo para subir o servidor
```shell
docker-compose up
```

O projeto está disponível em `http://localhost:3000`

## Testes [![Build Status](https://semaphoreapp.com/api/v1/projects/c89e95d8-895c-4956-be17-c29a01b7c281/271048/badge.png)](https://semaphoreapp.com/rubycastsbrasil/rubycastsbrasil)

Esse projeto utiliza o [rspec](http://rspec.info/) como framework de testes principal.
Todas as expectations estão de acordo com a nova forma da versão 3.0 do rspec.
A suíte de testes é monitarada pelo [semaphore app](https://semaphoreapp.com/rubycastsbrasil/rubycastsbrasil).

## Dependências [![Dependency Status](https://gemnasium.com/RubyCastsBrasil/RubyCastsBrasil.svg)](https://gemnasium.com/RubyCastsBrasil/RubyCastsBrasil)

Esse projeto utiliza o [bundler](http://bundler.io) para controle de dependências `ruby` e o
[bower](http://bower.io) para controle de dependências `js` e `css`.
O bower é utilizado em conjunto com o [bower-installer](https://github.com/blittle/bower-installer)
para ter um controle maior dos arquivos que entram no controle de versão.
Ambos são monitorados pelo [gemnasium](https://gemnasium.com).

## Controle da Qualidade [![Coverage Status](https://img.shields.io/coveralls/RubyCastsBrasil/RubyCastsBrasil.svg)](https://coveralls.io/r/RubyCastsBrasil/RubyCastsBrasil)

Para manter um alto controle de qualidade do código é utilizado o [simplecov](https://github.com/colszowka/simplecov)
para mensurar a quantidade de código coberto por testes.
Esse controle é monitorado pelo [coveralls](coveralls.io).

## Garantia da Qualidade [![Code Climate](https://codeclimate.com/github/RubyCastsBrasil/RubyCastsBrasil.png)](https://codeclimate.com/github/RubyCastsBrasil/RubyCastsBrasil)

Para garantir a qualidade, é utilizado um guia de estilos, boas práticas e má praticas.
Essa garantia é monitorada pelo [Code Climate](https://codeclimate.com) e pelo [houndci](http://houndci.com).
O Code Climate checa por má práticas de programação em relação a estrutura do código enquanto
que o Houndci checa má práticas na sintaxe do código, isto é, se a leitura do mesmo não é
demasiada complicada.

## Documentação [![Inline docs](http://inch-ci.org/github/RubyCastsBrasil/RubyCastsBrasil.png?branch=master)](http://inch-ci.org/github/RubyCastsBrasil/RubyCastsBrasil)

Para documentação é utilzado o [yardoc](http://yardoc.org/) que disponibiliza uma api flexível.
Para monitoramento da documentação é utilizado o [inch-ci](http://inch-ci.org/).

## Gerenciamento de Projeto [![Stories in Ready](https://badge.waffle.io/RubyCastsBrasil/RubyCastsBrasil.png?label=ready&title=Ready)](https://waffle.io/RubyCastsBrasil/RubyCastsBrasil)
[![Throughput Graph](https://graphs.waffle.io/rubycastsbrasil/rubycastsbrasil/throughput.svg)](https://waffle.io/rubycastsbrasil/rubycastsbrasil/metrics)

Para controle das funcionalidades, bugs, revisão de código e afins é utilizado o [waffle](http://waffle.io)
que trabalha em cima das issues do github, e disponibiliza um painel para um controle maior.

## Discussões [![Gitter chat](https://badges.gitter.im/RubyCastsBrasil/RubyCastsBrasil.png)](https://gitter.im/RubyCastsBrasil/RubyCastsBrasil)

Para discussões relacionadas ao projeto, é utilizado o [gitter](https://gitter.im) que disponibiliza
um chat em tempo real. Para discussões a longo prazo (assíncronas) é utilizado o [google groups](https://groups.google.com/forum/#!forum/rubycastsbrasil).

## Triagem de tarefas

Você pode acompanhar o projeto utilizando [Codetriage](http://www.codetriage.com/rubycastsbrasil/rubycastsbrasil). Ao efetuar o cadastro na plataforma, todos os dias você poderá receber um newsletter com algumas tarefas que precisam de ajuda para serem solucionadas.
