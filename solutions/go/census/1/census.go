// Package census simulates a system used to collect census data.
package census

import "strings"

// Resident represents a resident in this city.
type Resident struct {
	Name    string
	Age     int
	Address map[string]string
}

// NewResident registers a new resident in this city.
func NewResident(name string, age int, address map[string]string) *Resident {
	return &Resident{
		Name:    name,
		Age:     age,
		Address: address,
	}
}

// HasRequiredInfo determines if a given resident has all of the required information.
func (r *Resident) HasRequiredInfo() bool {
	if r.Name == "" || r.Address == nil || len(r.Address) == 0 {
		return false
	}

	var street_validate bool
	for k, v := range r.Address {
		if k == "" || v == "" {
			return false
		}
		if strings.ToLower(k) == "street" {
			street_validate = true
		}

	}

	return street_validate
}

// Delete deletes a resident's information.
func (r *Resident) Delete() {
	r.Name = ""
	r.Age = 0
	r.Address = nil
}

// Count counts all residents that have provided the required information.
func Count(residents []*Resident) int {
	var total int
	for _, v := range residents {
		if v.HasRequiredInfo() {
			total += 1
		}
	}

	return total
}
