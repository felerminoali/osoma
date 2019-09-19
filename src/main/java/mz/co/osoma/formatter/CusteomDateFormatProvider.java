package mz.co.osoma.formatter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.text.spi.DateFormatProvider;
import java.util.Locale;

public class CusteomDateFormatProvider extends DateFormatProvider {

    @Override
    public DateFormat getTimeInstance(int style, Locale locale) {
        return new SimpleDateFormat("dd MMM yyyy, HH:mm:ss");
    }

    public DateFormat getDateInstance(int style, Locale locale){
        return new SimpleDateFormat("dd MMM yyyy, HH:mm:ss");
    }

    @Override
    public DateFormat getDateTimeInstance(int dateStyle, int timeStyle, Locale locale) {
        return new SimpleDateFormat("dd MMM yyyy, HH:mm:ss");
    }

    @Override
    public Locale[] getAvailableLocales() {
        return new Locale[0];
    }
}
