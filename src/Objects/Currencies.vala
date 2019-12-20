/*
* Copyright(c) 2011-2019 Matheus Fantinel
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or(at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Matheus Fantinel <matfantinel@gmail.com>
*/

namespace Moneta {
    public enum Currency {
        US_DOLLAR,
        BRAZILIAN_REAL,
        EURO,
        POUND_STERLING;

        public string get_friendly_name() {
            switch (this) {   
                case US_DOLLAR:
                    return _("US Dollar");

                case BRAZILIAN_REAL:
                    return _("Brazilian Real");

                case EURO:
                    return _("Euro");

                case POUND_STERLING:
                    return _("British Pound");
    
                default:
                    assert_not_reached();
            }
        }

        public string get_iso_code() {
            switch (this) {   
                case US_DOLLAR:
                    return "USD";

                case BRAZILIAN_REAL:
                    return "BRL";

                case EURO:
                    return "EUR";

                case POUND_STERLING:
                    return "GBP";
    
                default:
                    assert_not_reached();
            }
        }

        public string get_symbol() {
            switch (this) {   
                case US_DOLLAR:
                    return "$";

                case BRAZILIAN_REAL:
                    return "R$";

                case EURO:
                    return "€";

                case POUND_STERLING:
                    return "£";
    
                default:
                    assert_not_reached();
            }
        }
    }
}
