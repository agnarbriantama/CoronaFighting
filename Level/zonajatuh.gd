extends Area2D


func _on_ZonaJatuh_body_entered(body):
	if body.name == 'karakter1':
		body.jurang()
