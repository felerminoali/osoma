/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import mz.co.osoma.model.User;

/**
 *
 * @author user
 */
@Entity
@Table(name = "question")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Question.findAll", query = "SELECT q FROM Question q")
    , @NamedQuery(name = "Question.findById", query = "SELECT q FROM Question q WHERE q.id = :id")
    , @NamedQuery(name = "Question.findByImage", query = "SELECT q FROM Question q WHERE q.image = :image")
    , @NamedQuery(name = "Question.findByTimecreated", query = "SELECT q FROM Question q WHERE q.timecreated = :timecreated")
    , @NamedQuery(name = "Question.findByTimemodified", query = "SELECT q FROM Question q WHERE q.timemodified = :timemodified")})
public class Question implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Lob
    @Column(name = "question")
    private String question;
    @Column(name = "image")
    private String image;
    @Lob
    @Column(name = "feedback")
    private String feedback;
    @Column(name = "timecreated")
    private BigInteger timecreated;
    @Column(name = "timemodified")
    private BigInteger timemodified;
    @Lob
    @Column(name = "extratext")
    private String extratext;
    @JoinColumn(name = "qtype", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Qtype qtype;
    @JoinColumn(name = "createdby", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private User createdby;
    @JoinColumn(name = "modifiedby", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private User modifiedby;
    @JoinColumn(name = "exam", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Exam exam;
    @OneToMany(mappedBy = "question", fetch = FetchType.LAZY)
    private List<QuestionAnswers> questionAnswersList;

    public Question() {
    }

    public Question(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public BigInteger getTimecreated() {
        return timecreated;
    }

    public void setTimecreated(BigInteger timecreated) {
        this.timecreated = timecreated;
    }

    public BigInteger getTimemodified() {
        return timemodified;
    }

    public void setTimemodified(BigInteger timemodified) {
        this.timemodified = timemodified;
    }

    public String getExtratext() {
        return extratext;
    }

    public void setExtratext(String extratext) {
        this.extratext = extratext;
    }

    public Qtype getQtype() {
        return qtype;
    }

    public void setQtype(Qtype qtype) {
        this.qtype = qtype;
    }

    public User getCreatedby() {
        return createdby;
    }

    public void setCreatedby(User createdby) {
        this.createdby = createdby;
    }

    public User getModifiedby() {
        return modifiedby;
    }

    public void setModifiedby(User modifiedby) {
        this.modifiedby = modifiedby;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    @XmlTransient
    public List<QuestionAnswers> getQuestionAnswersList() {
        return questionAnswersList;
    }

    public void setQuestionAnswersList(List<QuestionAnswers> questionAnswersList) {
        this.questionAnswersList = questionAnswersList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Question)) {
            return false;
        }
        Question other = (Question) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.Question[ id=" + id + " ]";
    }
    
}
