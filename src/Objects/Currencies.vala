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
        POUND_STERLING,
        AUSTRALIAN_DOLLAR,
        CANADIAN_DOLLAR,
        CHINESE_YUAN,
        INDIAN_RUPEE,
        JAPANESE_YEN,
        RUSSIAN_RUBLE,
        SWISS_FRANC,
        ARGENTINIAN_PESO,
        CZECH_KORUNA,
        MEXICAN_PESO;

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

                case AUSTRALIAN_DOLLAR:
                    return _("Australian Dollar");

                case CANADIAN_DOLLAR:
                    return _("Canadian Dollar");

                case CHINESE_YUAN:
                    return _("Chinese Yuan");

                case INDIAN_RUPEE:
                    return _("Indian Rupee");

                case JAPANESE_YEN:
                    return _("Japanese Yen");

                case RUSSIAN_RUBLE:
                    return _("Russian Ruble");

                case SWISS_FRANC:
                    return _("Swiss Franc");

                case ARGENTINIAN_PESO:
                    return _("Argentinian Peso");

                case CZECH_KORUNA:
                    return _("Czech Koruna");

                case MEXICAN_PESO:
                    return _("Mexican Peso");

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

                case AUSTRALIAN_DOLLAR:
                    return "AUD";

                case CANADIAN_DOLLAR:
                    return "CAD";

                case CHINESE_YUAN:
                    return "CNY";

                case INDIAN_RUPEE:
                    return "INR";

                case JAPANESE_YEN:
                    return "JPY";

                case RUSSIAN_RUBLE:
                    return "RUB";

                case SWISS_FRANC:
                    return "CHF";

                case ARGENTINIAN_PESO:
                    return "ARS";

                case CZECH_KORUNA:
                    return "CZK";

                case MEXICAN_PESO:
                    return "MXN";
    
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

                case AUSTRALIAN_DOLLAR:
                    return "A$";

                case CANADIAN_DOLLAR:
                    return "CA$";

                case CHINESE_YUAN:
                    return "¥";

                case INDIAN_RUPEE:
                    return "₹";

                case JAPANESE_YEN:
                    return "¥";

                case RUSSIAN_RUBLE:
                    return "₽";

                case SWISS_FRANC:
                    return "CHF";

                case ARGENTINIAN_PESO:
                    return "$";

                case CZECH_KORUNA:
                    return "Kč";

                case MEXICAN_PESO:
                    return "$";
    
                default:
                    assert_not_reached();
            }
        }
    }
}
