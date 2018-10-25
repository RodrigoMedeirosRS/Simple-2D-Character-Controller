# Desenvolvido por Rodrigo M.Lehnemann
# Todo este código é considerado como uma biblioteca a distribuído sob a licença LGPL v3
extends KinematicBody2D

# Esta variável serve para controlar os inputs de tela.
onready var LEFT = false
onready var RIGHT = false

# Esta variável controla a gravidade do game
onready var GRAVIDADE = -9.8

# Esta variável controla a velocidade do jogador.
onready var VELOCIDADE = 500

func _ready():
	set_physics_process(true)

# Função responsável por aplicar a gravidade do personagem.
func _gravidade(delta):
	
	# Este trecho serve para regular o salvo, assim caso a gravidade seja maior que o inicial, ela reduz gradativamente.
	if GRAVIDADE > -9.8:
		GRAVIDADE -= 40 * delta
	else:
		GRAVIDADE == -9.8
	
	# Aplica a gravidade a movimentação, aqui foi escolhido o uso do Move_And_Slide para que seja possível atualizar a função "on_floor".
	move_and_slide(Vector2(0, GRAVIDADE * -3000 * delta), Vector2(0, -1), 25.0)

# Função responsável por receber os inputs do jogador.
func _controles(delta):
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
			GRAVIDADE = 18
	
	if Input.is_action_pressed("ui_right") or RIGHT:
		move_and_collide(Vector2(VELOCIDADE *delta,0))
		
	if Input.is_action_pressed("ui_left") or LEFT:
		move_and_collide(Vector2(VELOCIDADE * -1 *delta,0))

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