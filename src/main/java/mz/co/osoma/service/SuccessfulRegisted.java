package mz.co.osoma.service;

import mz.co.osoma.model.User;

public class SuccessfulRegisted implements EmailBody {

    private User user;


    public SuccessfulRegisted(User user){
        this.user = user;
    }

    @Override
    public String create() {

        String str = "<div style='font-family:Arial,Verdana,Sans-serif;font-size:12px;color:#333;line-height:21px;'>";
        str += "<p>Caro "+user.getName()+" "+user.getLastName()+" <p/>";
        str += "<p>Muito obrigado por registar-se no osoma.edu.mz.<p/>";
        str += "<p>Os detalhes da sua conta s&atilde;o:<p/>";
        str += "<p>Usu&aacute;rio: "+user.getEmail()+"<p/>";
//        str += "<p>Por favor clique no link abaixo para poder activar sua conta</p>";
//        str += "<p></p>";
        str += "</div>";
        return str;
    }


}
