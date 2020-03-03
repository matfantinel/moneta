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

using Soup;
using Json;

namespace Moneta {
    public class MainWindow : Gtk.ApplicationWindow {
        public Gtk.Label label_result;
        public Gtk.Label label_info;
        public Gtk.Label label_history;
        public Gtk.ComboBox source_currency;
        public Gtk.ComboBox target_currency;
        public Gtk.Stack stack;
        public Gtk.Image aicon;

        public double avg;
        public double avg_history;
        public string source_iso;
        public string target_iso;

        AppSettings settings;

        public MainWindow(Gtk.Application application) {
            GLib.Object(application: application,
                         icon_name: "com.github.matfantinel.moneta",
                         resizable: false,
                         height_request: 280,
                         width_request: 500,
                         border_width: 6
            );
        }        

        construct {            
            setup_window_styles();

            settings = AppSettings.get_default();

            var icon = new Gtk.Image.from_icon_name("com.github.matfantinel.moneta-symbolic", Gtk.IconSize.DIALOG);

            setup_comboboxes();

            if(settings.source >= 0) {
                source_currency.set_active((Currency)(settings.source));
                source_iso = ((Currency)settings.source).get_iso_code();
            } else {
                source_currency.set_active(Currency.US_DOLLAR);
                source_iso = Currency.US_DOLLAR.get_iso_code();
            }

            if(settings.target >= 0) {
                target_currency.set_active((Currency)(settings.target));
                target_iso = ((Currency)settings.target).get_iso_code();
            } else {
                target_currency.set_active(Currency.US_DOLLAR);
                target_iso = Currency.US_DOLLAR.get_iso_code();
            }

            label_result = new Gtk.Label("");
            label_result.set_halign(Gtk.Align.END);
            label_result.hexpand = true;
            label_info = new Gtk.Label(_("Updated every 10 minutes"));
            label_info.set_halign(Gtk.Align.END);
            label_info.hexpand = true;
            label_result.set_halign(Gtk.Align.START);
            label_history = new Gtk.Label ("");

            aicon = new Gtk.Image ();
            aicon.icon_size = Gtk.IconSize.SMALL_TOOLBAR;

            get_values();
            set_labels();

            var avg_grid = new Gtk.Grid ();
            avg_grid.margin_top = 0;
            avg_grid.margin_start = 6;
            avg_grid.column_spacing = 6;
            avg_grid.attach (aicon, 0, 0, 1, 1);
            avg_grid.attach (label_history, 1, 0, 1, 1);

            var grid = new Gtk.Grid();
            grid.margin_top = 0;
            grid.column_homogeneous = true;
            grid.column_spacing = 6;
            grid.row_spacing = 6;
            grid.attach(icon, 0, 2, 1, 1);
            grid.attach(source_currency, 0, 1, 2, 1);
            grid.attach(target_currency, 2, 1, 2, 1);
            grid.attach(label_result, 1, 2, 3, 2);
            grid.attach (avg_grid, 0, 4, 1, 1);
            grid.attach(label_info, 1, 4, 3, 2);

            stack = new Gtk.Stack();
            stack.transition_type = Gtk.StackTransitionType.CROSSFADE;
            stack.margin = 6;
            stack.margin_top = 0;
            stack.homogeneous = true;
            stack.add_named(grid, "money");

            this.add(stack);
            stack.show_all();

            source_currency.changed.connect(() => {
                get_values();
                set_labels();
            });

            target_currency.changed.connect(() => {
                get_values();
                set_labels();
            });

            Timeout.add_seconds(600,() => {
                get_values();
                set_labels();
                return true;
            });

            int x = settings.window_x;
            int y = settings.window_y;
            int coin = source_currency.get_active();
            coin = settings.source;
            int vcoin = target_currency.get_active();
            vcoin = settings.target;

            if(x != -1 && y != -1) {
                move(x, y);
            }            

            button_press_event.connect((e) => {
                if(e.button == Gdk.BUTTON_PRIMARY) {
                    begin_move_drag((int) e.button,(int) e.x_root,(int) e.y_root, e.time);
                    return true;
                }
                return false;
            });
        }

        public override bool delete_event (Gdk.EventAny event) {
            int x, y;
            get_position (out x, out y);

            var settings = AppSettings.get_default ();
            settings.window_x = x;
            settings.window_y = y;

            return false;
        }

        public void setup_window_styles() {
            var provider = new Gtk.CssProvider();
            provider.load_from_resource("/com/github/matfantinel/moneta/stylesheet.css");
            Gtk.StyleContext.add_provider_for_screen(Gdk.Screen.get_default(), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
            stick();

            var titlebar = new Gtk.HeaderBar();
            titlebar.has_subtitle = false;
            titlebar.show_close_button = true;
            titlebar.custom_title = new Gtk.Label("Moneta");

            var titlebar_style_context = titlebar.get_style_context();
            titlebar_style_context.add_class(Gtk.STYLE_CLASS_FLAT);
            titlebar_style_context.add_class("default-decoration");
            titlebar_style_context.add_class("moneta-toolbar");

            this.set_titlebar(titlebar);
            this.set_title("Moneta");

            this.get_style_context().add_class("rounded");            
        }

        public void setup_comboboxes() {
            string[] currencies = {
                Currency.US_DOLLAR.get_friendly_name(),
                Currency.BRAZILIAN_REAL.get_friendly_name(),
                Currency.EURO.get_friendly_name(),
                Currency.POUND_STERLING.get_friendly_name(),
                Currency.AUSTRALIAN_DOLLAR.get_friendly_name(),
                Currency.CANADIAN_DOLLAR.get_friendly_name(),
                Currency.CHINESE_YUAN.get_friendly_name(),
                Currency.INDIAN_RUPEE.get_friendly_name(),
                Currency.JAPANESE_YEN.get_friendly_name(),
                Currency.RUSSIAN_RUBLE.get_friendly_name(),
                Currency.SWISS_FRANC.get_friendly_name(),
                Currency.ARGENTINIAN_PESO.get_friendly_name(),
                Currency.CZECH_KORUNA.get_friendly_name(),
                Currency.MEXICAN_PESO.get_friendly_name(),
                Currency.HUNGARIAN_FORINT.get_friendly_name(),
                Currency.KAZAKHSTANI_TENGE.get_friendly_name()
            };
            Gtk.ListStore source_list_store = new Gtk.ListStore(1, typeof(string));

            for (int i = 0; i < currencies.length; i++){
                Gtk.TreeIter iter;
                source_list_store.append (out iter);
                source_list_store.set (iter, 0, currencies[i]);
            }
    
            source_currency = new Gtk.ComboBox.with_model(source_list_store);
            source_currency.margin = 6;

            Gtk.CellRendererText source_cell = new Gtk.CellRendererText();
            source_currency.pack_start(source_cell, false);

            source_currency.set_attributes(source_cell, "text", 0);

            Gtk.ListStore target_list_store = new Gtk.ListStore(1, typeof(string));

            for (int i = 0; i < currencies.length; i++){
                Gtk.TreeIter iter;
                target_list_store.append (out iter);
                target_list_store.set (iter, 0, currencies[i]);
            }
    
            target_currency = new Gtk.ComboBox.with_model(target_list_store);
            target_currency.margin = 6;

            Gtk.CellRendererText target_cell = new Gtk.CellRendererText();
            target_currency.pack_start(target_cell, false);

            target_currency.set_attributes(target_cell, "text", 0);
        }

        public bool get_values() {
            settings.source = source_currency.get_active();
            if(settings.source >= 0) {
                source_iso = ((Currency)settings.source).get_iso_code();
            } else {
                source_currency.set_active(Currency.US_DOLLAR);
                source_iso = Currency.US_DOLLAR.get_iso_code();
            }


            settings.target = target_currency.get_active();
            if(settings.target >= 0) {
                target_iso = ((Currency)settings.target).get_iso_code();
            } else {
                target_currency.set_active(Currency.US_DOLLAR);
                target_iso = Currency.US_DOLLAR.get_iso_code();
            }
            
            var uri = "https://fcsapi.com/api/forex/latest?symbol=" + target_iso + "/" + source_iso + "&access_key=R32PaI8NK9B6uHGvP6FvfiJXlwcAMRHu7KpMAK46vrmzhBxXQ";
            
            var session = new Soup.Session();
            var message = new Soup.Message("GET", uri);
            session.send_message(message);

            try {
                var parser = new Json.Parser();

                stdout.printf("🌳️ Result: "+ (string)message.response_body.flatten().data + "\n");

                parser.load_from_data((string) message.response_body.flatten().data, -1);
                var root_object = parser.get_root().get_object();
                if (root_object == null) {
                    avg = -1;
                    avg_history = 0;
                    return false;
                }

                var status = root_object.get_boolean_member("status");

                if (!status) {
                    avg = 0;
                    avg_history = 0;
                    return false;
                }

                var response_array = root_object.get_array_member("response");
                var response_object = response_array.get_object_element(0);
                
                var price = response_object.get_string_member("price");
                if (price != null && price.length > 0) {
                    avg = price.to_double();
                }

                var chg_per = response_object.get_string_member("chg_per");
                if (chg_per != null && chg_per.length > 0) {                    
                    avg_history = chg_per.to_double();
                }
            } catch(Error e) {
                warning("Failed to connect to service: %s", e.message);
                stdout.printf("🛑 Error fetching data: "+ e.message + "\n");
                avg = -1;
            }

            return true;
        }

        public void set_labels() {
            var settings = AppSettings.get_default();
            var curr_symbol = "";
            settings.source = source_currency.get_active();
            curr_symbol = ((Currency)settings.source).get_symbol();

            var target_curr_symbol = "";
            settings.target = target_currency.get_active();
            target_curr_symbol = ((Currency)settings.target).get_symbol();            

            if (avg > 0) {
                label_result.set_markup("""<span font="22">%s</span> <span font="30">%.4f</span> <span font="18">/ 1 %s</span>""".printf(curr_symbol, avg, target_curr_symbol));
                this.set_title("%s %.4f / 1 %s".printf(curr_symbol, avg, target_curr_symbol));
            } else if (avg == 0){
                label_result.set_markup("""<span font="22">%s</span>""".printf("No info"));
                this.set_title("Moneta - No info");
            } else {
                label_result.set_markup("""<span font="22">%s</span>""".printf("No connection"));
                this.set_title("Moneta - No connection");
            }

            label_history.set_markup ("""<span font="10">%.2f %</span>""".printf(avg_history));

            set_history_styles();
        }

        public void set_history_styles() {
            if (avg_history <= 0.0) {
                aicon.icon_name = "go-down-symbolic";
                var context = aicon.get_style_context ();
                context.add_class ("negative-icon");
                context.remove_class ("positive-icon");
            } else {
                aicon.icon_name = "go-up-symbolic";
                var context = aicon.get_style_context ();
                context.remove_class ("negative-icon");
                context.add_class ("positive-icon");
            }
        }
    }
}
