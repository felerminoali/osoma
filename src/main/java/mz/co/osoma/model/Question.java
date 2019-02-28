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

/**
 *
 * @author user
 */
@Entity
@Table(name = "question")
@NamedQueries({
    @NamedQuery(name = "Question.findAll", query = "SELECT q FROM Question q")})
public class Question implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "exam_id")
    private Integer examId;
    @Column(name = "name")
    private String name;
    @Lob
    @Column(name = "questiontextformat")
    private String questiontextformat;
    @Column(name = "image")
    private String image;
    @Lob
    @Column(name = "feedback")
    private String feedback;
    @Column(name = "timecreated")
    private BigInteger timecreated;
    @Column(name = "timemodified")
    private BigInteger timemodified;
    @Column(name = "createdby")
    private Integer createdby;
    @Column(name = "modifiedby")
    private Integer modifiedby;
    @JoinColumn(name = "qtype", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Qtype qtype;
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

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getQuestiontextformat() {
        return questiontextformat;
    }

    public void setQuestiontextformat(String questiontextformat) {
        this.questiontextformat = questiontextformat;
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

    public Integer getCreatedby() {
        return createdby;
    }

    public void setCreatedby(Integer createdby) {
        this.createdby = createdby;
    }

    public Integer getModifiedby() {
        return modifiedby;
    }

    public void setModifiedby(Integer modifiedby) {
        this.modifiedby = modifiedby;
    }

    public Qtype getQtype() {
        return qtype;
    }

    public void setQtype(Qtype qtype) {
        this.qtype = qtype;
    }

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
