# Desenvolvido por Rodrigo M.Lehnemann
# Melhorias feitas por João Ricardo Bittencourt
# Todo este código é considerado como uma biblioteca a distribuído sob a licença LGPL v3
extends KinematicBody2D

# Esta variável serve para controlar os inputs de tela.
onready var LEFT = false
onready var RIGHT = false

# Esta variável controla a gravidade do game
onready var GRAVIDADE = -9.8

#String que representa a ação de mover para direita
export(String) var Acao_Direita = "ui_right"
#String que representa a ação de mover para esquerda
export(String) var Acao_Esquerda = "ui_left"
#String que representa a ação de pulo
export(String) var Acao_Pulo = "ui_up"
#Velocidade de queda
export(int) var Velocidade_Queda =  40
# Esta variável controla a velocidade do jogador.
export(int) var Velocidade =  500

#Pega a referencia para os sprites
onready var sprite_cabeca
onready var sprite_corpo
onready var sprite_perna
onready var sprite_braco

func _ready():
	set_physics_process(true)
	sprite_cabeca = $Cabeca
	sprite_corpo = $Cabeca/Corpo
	sprite_perna = $Cabeca/Perna
	sprite_braco = $Cabeca/Braco

#Função para fazer o flip horizontal dos sprites
func virar(ativar):
	sprite_cabeca.flip_h = ativar
	sprite_corpo.flip_h = ativar
	sprite_perna.flip_h = ativar
	sprite_braco.flip_h = ativar
	
# Função responsável por aplicar a gravidade do personagem.
func _gravidade(delta):
	
	# Este trecho serve para regular o salvo, assim caso a gravidade seja maior que o inicial, ela reduz gradativamente.
	if GRAVIDADE > -9.8:
		GRAVIDADE -= Velocidade_Queda * delta
	else:
		GRAVIDADE == -9.8
	
	# Aplica a gravidade a movimentação, aqui foi escolhido o uso do Move_And_Slide para que seja possível atualizar a função "on_floor".
	move_and_slide(Vector2(0, GRAVIDADE * -3000 * delta), Vector2(0, -1), 25.0)

# Função responsável por receber os inputs do jogador.
func _controles(delta):
	if Input.is_action_just_pressed(Acao_Pulo) and is_on_floor():
			GRAVIDADE = 18
	
	if Input.is_action_pressed(Acao_Direita) or RIGHT:
		move_and_collide(Vector2(Velocidade *delta,0))
		virar(false)
		
	if Input.is_action_pressed(Acao_Esquerda) or LEFT:
		move_and_collide(Vector2(Velocidade * -1 *delta,0))
		virar(true)

#estas funções controlam os inputs de tela.
func _on_Salto_button_down():
	if is_on_floor():
		GRAVIDADE = 18

func _on_Direita_button_down():
	RIGHT = true

func _on_Direita_button_up():
	RIGHT = false

func _on_Equerda_button_down():
	LEFT = true

func _on_Equerda_button_up():
	LEFT = false

# Controla o loop de execução.
func _physics_process(delta):
	_gravidade(delta)
	_controles(delta)