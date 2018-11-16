# Desenvolvido por Rodrigo M.Lehnemann
# Melhorias feitas por João Ricardo Bittencourt
# Todo este código é considerado como uma biblioteca a distribuído sob a licença LGPL v3
extends KinematicBody2D

# Esta variável controla a gravidade do game
onready var GRAVIDADE = -9.8

#String que representa a ação de mover para direita
export(String) var Acao_Direita = "ui_right"
#String que representa a ação de mover para esquerda
export(String) var Acao_Esquerda = "ui_left"
#String que representa a ação de pulo
export(String) var Acao_Pulo = "ui_up"
#String que representa a animação de mover
export(String) var Anim_Walk = "Walk"
#String que representa a animação de parado
export(String) var Anim_Idle = "Idle"
#String que representa a animação de pulando
export(String) var Anim_Jump = "Jump"
#String que representa a animação de dano
export(String) var Anim_Hurt = "Hurt"

#Peso do personagem, influência na velocidade da queda.
export(int) var Peso =  40
# Esta variável controla a velocidade do jogador.
export(int) var Velocidade =  500

func _ready():
	set_physics_process(true)

# Função responsável por aplicar a gravidade do personagem.
func _gravidade(delta):
	
	# Este trecho serve para regular o salvo, assim caso a gravidade seja maior que o inicial, ela reduz gradativamente.
	if GRAVIDADE > -9.8:
		GRAVIDADE -= Peso * delta
	else:
		GRAVIDADE == -9.8
	
	# Aplica a gravidade a movimentação, aqui foi escolhido o uso do Move_And_Slide para que seja possível atualizar a função "on_floor".
	move_and_slide(Vector2(0, GRAVIDADE * -3000 * delta), Vector2(0, -1), 25.0)

# Função responsável por receber os inputs do jogador.
func _controles(delta):
	if Input.is_action_just_pressed(Acao_Pulo) and is_on_floor():
		GRAVIDADE = 18
	
	#Confere de a ação foi executada
	if Input.is_action_pressed(Acao_Direita):
		#Aplica o movimento ao personagem
		move_and_collide(Vector2(Velocidade *delta,0))
		#Vira o sprite para direita
		if get_child(0).scale.x != 1:
			get_child(0).scale.x = 1
		#reproduz a animação de caminhada
		if get_child(1).current_animation != Anim_Walk:
			get_child(1).play(Anim_Walk)
	
	#Confere de a ação foi executada
	if Input.is_action_pressed(Acao_Esquerda):
		#Aplica o movimento ao personagem
		move_and_collide(Vector2(Velocidade * -1 *delta,0))
		#Vira o sprite para esquerda
		if get_child(0).scale.x != -1:
			get_child(0).scale.x = -1
		#reproduz a animação de caminhada
		if get_child(1).current_animation != Anim_Walk:
			get_child(1).play(Anim_Walk)
	
	if is_on_floor():
		#Confere se nenhuma ação está sendo executada
		if !Input.is_action_pressed(Acao_Direita) and !Input.is_action_pressed(Acao_Esquerda) and is_on_floor():
			#reproduz a animação de idle
			if get_child(1).current_animation != Anim_Idle:
				get_child(1).play(Anim_Idle)
	else:
		#reproduz a animaçãode salto
		if get_child(1).current_animation != Anim_Jump:
				get_child(1).play(Anim_Jump)

# Controla o loop de execução.
func _physics_process(delta):
	_gravidade(delta)
	_controles(delta)