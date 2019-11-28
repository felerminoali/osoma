package mz.co.osoma.service;

import org.jsoup.Jsoup;

import java.util.Hashtable;

public class Helper {

    public static Hashtable<String, String> lang = new Hashtable<String, String>() {{
        put("en", "/images/lang/en.png");
        put("pt", "/images/lang/pt.png");
    }};


    public static String shortenPlainText(String plainText){
        return plainText.substring(0, 120);
    }

    public static String shortenHTMLText(String htmlText){
        String noHtmlCaseOfStudy = Jsoup.parse(htmlText).text();
        return  shortenPlainText(noHtmlCaseOfStudy);
    }

    public static String linkModal(){
        return " ... " + "<a href=\"#\" data-toggle=\"modal\" data-target=\"#myModal\">Monstrar mais</a>";
    }

    public static String convertSecondsToTimeFormat(int timeInSeconds){

        String result = "";

        int hour = (timeInSeconds/3600);
        int minute = (timeInSeconds/60);
        if(minute>=60){
            hour++;
            minute = minute%60;
        }
        int seconds = (timeInSeconds%60);
        if (seconds == 60){
            minute++;
            seconds = 0;
        }

        result=timeFormatter(hour)+":"+timeFormatter(minute)+":"+timeFormatter(seconds);

        return result;
    }


    private static String timeFormatter(int value){
        return (value<10) ? "0"+value : value+"";
    }
}
