package com.obj;

import java.io.FileInputStream;
import java.util.Properties;


public class Profile{
    
    public static Properties getProfile(String profilePath){
        FileInputStream in = null;
        Properties properties = new Properties();
        try{
            in = new FileInputStream(profilePath);
            properties.load(in);
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("∂¡»°≈‰÷√–≈œ¢ ß∞‹£°");
            System.out.println("profilePath:" + profilePath);
        }finally{
            if(in != null){
                try{
                    in.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return properties;
    }
}
