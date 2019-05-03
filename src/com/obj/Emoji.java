package com.obj;

import java.io.File;
import java.util.ArrayList;

public class Emoji {
    private String emojiUrl;
    
    public String getEmojiUrl() {
        return emojiUrl;
    }
    public void setEmojiUrl(String emojiUrl) {
        this.emojiUrl = emojiUrl;
    }
    
    public Emoji(String emojiUrl) {
        super();
        this.emojiUrl = emojiUrl;
    }
    
    public static boolean getEmojiList(String path, ArrayList<Emoji> emojiList) {
        File file = new File(path);        //��ȡ��file����
        if(file.exists()) {
            func(file, path, emojiList);
            return true;
        }
        return false;
    }
    private static void func(File file, String path, ArrayList<Emoji> emojiList) {
        File[] fs = file.listFiles();
        for(File f:fs){
            if(f.isDirectory())    //����Ŀ¼����ݹ��ӡ��Ŀ¼�µ��ļ�
                func(f,path, emojiList);
            if(f.isFile()) {
                String emojiPath = "sys\\pic\\emoji" + f.getPath().replace(path, "");
                emojiList.add(new Emoji(emojiPath.replace("\\", "/")));
            }
        }
    }

    
}
