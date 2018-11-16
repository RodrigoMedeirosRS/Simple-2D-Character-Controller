## Simple 2D Character Controller :v:

<img src="https://raw.githubusercontent.com/RodrigoMedeirosrRS/Simple-2D-Character-Controller/master/icon.png" alt="Simple 2D Character Controller" />

Este é um controlador simples de personagem para jogos 2D para Godot, seu principal objetivo é ser simples efacilamente adaptável para qualquer projeto de jogo 2D, tanto mobile quanto para PC ou Desktop. 

**Compatível com:** Godot 3 e 3.1. :wink:

### Como Usar: :sunglasses:
1. Faça o download deste repositório como um Zip.
2. Abra o projeto na godot.
3. Modique-o e use-o a vontade.
4. Compartilhe as melhorias que você fizer nele com a gente!

### Alterando o Herói: :metal:
É possível facilmente alterar os sprites e os parâmetro do jogo como peso do herói, velocidade e animações.

**1. Selecione a cena do herói, ali você terá vários parâmetro configuráveis:**

<img src="https://raw.githubusercontent.com/RodrigoMedeirosrRS/Simple-2D-Character-Controller/master/Other/Hero.jpg" alt="Configurable Parameters." />

- *Velocidade:* velocidade de movimentação horizontal do personagem.
- *Peso:* determina o quão pesado e o quão veloz o personagem cai.

- *Anim Walk:* nome da animação de movimento do personagem.
- *Anim Jump:* nome da animação de pulo do personagem.
- *Anim Idle:* nome da animação de idle do personagem.
- *Anim Hurt:* nome da animação de dano do personagem.

- *Ação Direita:* nome do input determinado para ação de movimento para direita.
- *Ação Esquerda:* nome do input determinado para ação de movimento para esquerda.
- *Ação Pulo:* nome do input determinado para ação de pulo.

**2. Para alterar a os sprites do personagem.**

<img src="https://raw.githubusercontent.com/RodrigoMedeirosrRS/Simple-2D-Character-Controller/master/Other/Hero2.jpg" alt="Character Sprites." />

- Abra a cena do herói.
- Veja que existe um **Node2D** initulado hero sprite e como filho desse nodo há um **Sprite2D** intitulado HeroSprite.
- Você pode alterar livremente o HeroSprite, assim como seu colisor e o animation player, essas alterações não afetarão o código jogo, e funcinarão normalmente, inclusive se você adicionar mais sprites como filhos HeroSprite. Apenas se certifique que você está mudando o nome das animações na cena sprite e deixando tudo igual ao que colocou nos parâmetros indicados no item 1.

