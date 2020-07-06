/*
* Copyright(c) 2011-2020 Matheus Fantinel
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
        US_DOLLAR = 0,
        BRAZILIAN_REAL = 1,
        EURO = 2,
        POUND_STERLING = 3,
        AUSTRALIAN_DOLLAR = 4,
        CANADIAN_DOLLAR = 5,
        CHINESE_YUAN = 6,
        INDIAN_RUPEE = 7,
        JAPANESE_YEN = 8,
        RUSSIAN_RUBLE = 9,
        SWISS_FRANC = 10,
        ARGENTINIAN_PESO = 11,
        CZECH_KORUNA = 12,
        MEXICAN_PESO = 13,
        HUNGARIAN_FORINT = 14,
        KAZAKHSTANI_TENGE = 15,
        TAIWAN_DOLLAR = 16;

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

                case HUNGARIAN_FORINT:
                    return _("Hungarian Forint");

                case KAZAKHSTANI_TENGE:
                    return _("Kazakhstani Tenge");

                case TAIWAN_DOLLAR:
                    return _("Taiwan Dollar");

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

                case HUNGARIAN_FORINT:
                    return "HUF";

                case KAZAKHSTANI_TENGE:
                    return "KZT";

                case TAIWAN_DOLLAR:
                    return "TWD";
    
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

                case HUNGARIAN_FORINT:
                    return "Ft";

                case KAZAKHSTANI_TENGE:
                    return "₸";

                case TAIWAN_DOLLAR:
                    return "NT$";
    
                default:
                    assert_not_reached();
            }
        }
    }
}
