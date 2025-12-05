package com.obj;

import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.Properties;


public class Profile{
    
    public static Properties getProfile(String profilePath){
        FileInputStream in = null;
        InputStreamReader reader = null;
        Properties properties = new Properties();
        try{
            in = new FileInputStream(profilePath);
            reader = new InputStreamReader(in,"utf-8");
            properties.load(reader);
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("read config fail.");
            System.out.println("profilePath:" + profilePath);
        }finally{
            if(in != null){
                try{
                    in.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
            if(reader != null){
                try{
                    reader.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            }
        }
        return properties;
    }
}
