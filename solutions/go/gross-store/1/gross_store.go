package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	return map[string]int{
		"quarter_of_a_dozen": 3,
		"half_of_a_dozen":    6,
		"dozen":              12,
		"small_gross":        120,
		"gross":              144,
		"great_gross":        1728,
	}
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	return map[string]int{}
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	if unit == "" || units[unit] == 0 {
		return false
	}

	bill[item] += units[unit]
	return true
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	var value, exists = bill[item]
	if !exists || unit == "" || units[unit] == 0 {
		return false
	}

	new_qty := value - units[unit]
	switch {
	case new_qty < 0:
		return false
	case new_qty > 0:
		bill[item] -= units[unit]
		return true
	case new_qty == 0:
		delete(bill, item)
		return true
	default:
		return false
	}
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	var value, exists = bill[item]
	if !exists {
		return 0, false
	}

	return value, true
}
