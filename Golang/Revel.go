package models

import (
	"github.com/revel/revel"
)

type Hotel struct {
	HotelID          int
	Price            int
}

func (hotel *Hotel) Validate(v *revel.Validation) {
	v.Check(hotel.Name,
		revel.Required{},
		revel.MaxSize{Max: 50})
	}
