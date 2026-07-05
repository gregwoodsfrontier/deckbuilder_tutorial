extends Resource
class_name CardPile

signal card_pile_size_changed(cards_amount)

@export var cards_array: Array[Card] = []

func check_empty() -> bool:
	return cards_array.is_empty()

func draw_from_top() -> Card:
	var top_card = cards_array.pop_front()
	card_pile_size_changed.emit(cards_array.size())
	return top_card

func clear_pile() -> void:
	cards_array.clear()
	card_pile_size_changed.emit(cards_array.size())

func add_card(card: Card):
	cards_array.append(card)
	card_pile_size_changed.emit(cards_array.size())

func shuffle() -> void:
	cards_array.shuffle()

# DEBUG method
func _debug_string() -> String:
	var _card_strings: PackedStringArray = []
	for i in cards_array.size():
		_card_strings.append("%s: %s" % [i+1, cards_array[i].id])
	var result = "\n".join(_card_strings)
	return result
