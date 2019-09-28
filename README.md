Este projeto é um gerenciador de troféus.

Um usuário ganha troféus ao atingir certas metas, como coletar uma quantidade de moedas,
matar um quantidade de monstros específicos ou morrer uma quantidade de vezes.

A api foi desenvolvida usando Ruby on Rails, usando testes com RSpec e o Rubocop como linter de código.

Existe rota para web onde por meio de um painel de administrador conseguimos fazer cadastros e criando metas, monstros, coletar moedas e etc.

Existe também endpoints para consumir em aplicações separadas, no caso foi desenvolvido um app usando React Native.

# Rodando o projeto
- Clone o repositório
- Rode o comando "bundle install"
- Rode o comando "rspec" para rodar os testes
- Rode o comando "rails s" para iniciar o servidor
- Vá para rota "http://localhost:3000/admin" para acessar o painel de administrador

Painel web: http://trophy-manager.herokuapp.com/admin/

Repositório do aplicativo: https://github.com/diogoqds/trophy_manager_app