package DATA;

import Model.asiento;
import Model.progresBar;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class asientoData {

    List<asiento> lista_asientos;

    public asientoData() {
        this.lista_asientos = new ArrayList<>();
    }

    public List<asiento> getAsientos() {
        return lista_asientos;
    }

    public void consultaImagenes(HttpServletRequest requestMain, progresBar pb) {

        for (int i = 0; i < lista_asientos.size(); i++) {
            try {
                lista_asientos.get(i).obtener64();
                HttpSession session = requestMain.getSession();

                pb.setValue((1f / lista_asientos.size()) * 100f, 85);

                Thread.sleep(1000);

                session.setAttribute("parametro_value_bar", String.valueOf(pb.getValue_porcent()));
            } catch (InterruptedException ex) {
                Logger.getLogger(asientoData.class.getName()).log(Level.SEVERE, null, ex);
            }
            //request.setAttribute("bar", i);
        }
    }
}
