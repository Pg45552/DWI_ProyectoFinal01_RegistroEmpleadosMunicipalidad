/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DATA;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class JsonData {

    public static String getDataFrom(JSONObject json, String rutaJson) {

        if (rutaJson.split("/").length > 1) {
            try {
                return getDataFrom(json.getJSONObject(rutaJson.substring(0, rutaJson.indexOf("/"))), rutaJson.substring(rutaJson.indexOf("/") + 1, rutaJson.length()));
            } catch (JSONException ex) {
               // Logger.getLogger(JsonData.class.getName()).log(Level.SEVERE, null, ex);
                return "";
            }
        } else {
            try {
                return json.get(rutaJson).toString();
                
            } catch (JSONException ex) {
                //Logger.getLogger(JsonData.class.getName()).log(Level.SEVERE, null, ex);
                return "";
            }
        }
    }
        public static JSONArray getArrayFrom(JSONObject json, String rutaJson) {

        if (rutaJson.split("/").length > 1) {
            try {
                return getArrayFrom(json.getJSONObject(rutaJson.substring(0, rutaJson.indexOf("/"))), rutaJson.substring(rutaJson.indexOf("/") + 1, rutaJson.length()));
            } catch (JSONException ex) {
                //Logger.getLogger(JsonData.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
        } else {
            try {
                return json.getJSONArray(rutaJson);
            } catch (JSONException ex) {
               // Logger.getLogger(JsonData.class.getName()).log(Level.SEVERE, null, ex);
                return null;
            }
        }
    }
}
