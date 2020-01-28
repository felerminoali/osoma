package mz.co.osoma.service;

import mz.co.osoma.model.Choice;
import mz.co.osoma.model.Question;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.Period;
import java.util.*;
import java.util.concurrent.TimeUnit;

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

    public static int getDiffYears(Date first) {

        Calendar calendar = new GregorianCalendar();
        calendar.setTime(first);
        int firt = calendar.get(Calendar.YEAR);
        calendar.setTime(Calendar.getInstance().getTime());
        int second = calendar.get(Calendar.YEAR);

        return (second-firt);
    }



    private static String timeFormatter(int value){
        return (value<10) ? "0"+value : value+"";
    }

    public static String timeDifferenceInSeconds(Date firstDate, Date secondDate){

        long diffInMillies = Math.abs(secondDate.getTime() - firstDate.getTime());
        long diff = TimeUnit.SECONDS.convert(diffInMillies, TimeUnit.MILLISECONDS);

        return convertSecondsToTimeFormat((int) diff);
    }

    public static int isCorrectChoice(Question question, String choice){
        if (choice == null) return -1;

        String[] arrayChoice = choice.split("_");
        Integer choiceId = Integer.parseInt(arrayChoice[0]);

//        Integer choiceId = Integer.parseInt(choice);
        for (Choice c:question.getChoiceList()) {
            if (c.getId().intValue() == choiceId.intValue()){
                return c.getRightchoice() == 1 ? 1 : 0;
            }
        }
        return 0;
    }

    public static String asciiToString(int value){
        return ((char) value)+"";
    }

    public static String getlabel(String answerSession){
        if (answerSession == null) return null;
        String[] array = answerSession.split("_");
        return array[1];
    }
}
