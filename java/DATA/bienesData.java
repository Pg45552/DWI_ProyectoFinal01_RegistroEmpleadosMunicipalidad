/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DATA;

import Model.bienes;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 *
 * @author User
 */
public class bienesData {

    ArrayList<bienes> listaBienes;

    public bienesData() {
        this.listaBienes = new ArrayList<>();
    }

    public ArrayList<bienes> getListaBienes() {
        return listaBienes;
    }

    public void setListaBienes(ArrayList<bienes> listaBienes) {
        this.listaBienes = listaBienes;
    }

    public List<bienes> getBienesUnicos_Natural() {
        List<bienes> lista_agrupada = new ArrayList<>();
        Map<String, List<bienes>> bieneslistGrouped = listaBienes.stream().collect(Collectors.groupingBy(w -> w.getGroupby()));

        for (Map.Entry<String, List<bienes>> entry : bieneslistGrouped.entrySet()) {

            lista_agrupada.add(new bienes(entry.getKey(), "N"));

        }
        return lista_agrupada;
    }

    public List<bienes> getBienesUnicos_Juridico() {
        List<bienes> lista_agrupada = new ArrayList<>();
        Map<String, List<bienes>> bieneslistGrouped = listaBienes.stream().collect(Collectors.groupingBy(w -> w.getGroupby()));

        for (Map.Entry<String, List<bienes>> entry : bieneslistGrouped.entrySet()) {

            lista_agrupada.add(new bienes(entry.getKey(), "J"));

        }
        return lista_agrupada;
    }

    public List<bienes> getBienesDe(String key) {
        List<bienes> lista_agrupada = new ArrayList<>();
        Map<String, List<bienes>> bieneslistGrouped = listaBienes.stream().collect(Collectors.groupingBy(w -> w.getGroupby()));

        for (Map.Entry<String, List<bienes>> entry : bieneslistGrouped.entrySet()) {
            if (key.equals(entry.getKey())) {

                lista_agrupada.addAll(entry.getValue());
            }

        }
        return lista_agrupada;

    }
    

}
