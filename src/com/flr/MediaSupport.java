package com.flr;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class DirtyWordsFilter
 */
@WebFilter("/DirtyWordsFilter")
public class MediaSupport implements Filter {
	public void init(FilterConfig filterConfig) throws ServletException {
    }
 
    public void doFilter(ServletRequest req, ServletResponse resp,
            FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request;
        HttpServletResponse response;
        try{
            request = (HttpServletRequest)req;
            response = (HttpServletResponse)resp;
        }catch(Exception e){
            throw new RuntimeException("non-http request or response");
        }
        HttpServletRequestMediaSupport dwrequest = new HttpServletRequestMediaSupport(request);
        chain.doFilter(dwrequest, response);
 
    }
 
    public void destroy() {
    }
 
}
class HttpServletRequestMediaSupport extends HttpServletRequestWrapper{
    public HttpServletRequestMediaSupport(HttpServletRequest request){
        super(request);
    }
 
    public String getParameter(String name) {
        String value = super.getParameter(name);
        if(value==null)
            return value;
        if("textarea".equalsIgnoreCase(name)) {
        	String text = value;
    		String videoHtml = "<video src=* controls=\"controls\" style=\"max-width:1024px\"></video>";
    		String audioHtml = "<audio src=* controls=\"controls\" loop=\"loop\"></audio>";
    		String imageHtml = "<a href=*><img src=* style=\"max-width:1024px\"/></a>";
    		int videoStart = text.indexOf("$video");
    		int videoEnd = text.indexOf("video$");
    		while(videoStart != -1 && videoEnd != -1 && videoStart < videoEnd) {
    			String video = text.substring(videoStart, videoEnd + 6);
    			String[] temp = video.split("\'");
    			String videoUrl = "\"" + temp[1] + "\"";
    			videoHtml = videoHtml.replace("*", videoUrl);
    			text = text.replace(video, videoHtml);
    			videoStart = text.indexOf("$video");
    			videoEnd = text.indexOf("video$");
    		}
    		int audioStart = text.indexOf("$audio");
    		int audioEnd = text.indexOf("audio$");
    		while(audioStart != -1 && audioEnd != -1 && audioStart < audioEnd) {
    			String audio = text.substring(audioStart, audioEnd + 6);
    			String[] temp = audio.split("\'");
    			String audioUrl = "\"" + temp[1] + "\"";
    			audioHtml = audioHtml.replace("*", audioUrl);
    			text = text.replace(audio, audioHtml);
    			audioStart = text.indexOf("$audio");
    			audioEnd = text.indexOf("audio$");
    		}
    		int imageStart = text.indexOf("$image");
    		int imageEnd = text.indexOf("image$");
    		while(imageStart != -1 && imageEnd != -1 && imageStart < imageEnd) {
    			String image = text.substring(imageStart, imageEnd + 6);
    			String[] temp = image.split("\'");
    			String imageUrl = "\"" + temp[1] + "\"";
    			imageHtml = imageHtml.replace("*", imageUrl);
    			text = text.replace(image, imageHtml);
    			imageStart = text.indexOf("$image");
    			imageEnd = text.indexOf("image$");
    		}
        	value = text;
        }
        return value;
    }

}
