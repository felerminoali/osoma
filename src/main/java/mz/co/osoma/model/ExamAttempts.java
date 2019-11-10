/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author user
 */
@Entity
@Table(name = "exam_attempts")
@NamedQueries({
    @NamedQuery(name = "ExamAttempts.findAll", query = "SELECT e FROM ExamAttempts e")})
public class ExamAttempts implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ExamAttemptsPK examAttemptsPK;
    @Column(name = "start")
    @Temporal(TemporalType.TIMESTAMP)
    private Date start;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "score")
    private Double score;
    @JoinColumn(name = "exam", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Exam exam;
    @JoinColumn(name = "user", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private User user;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "examAttempts", fetch = FetchType.LAZY)
    private List<AttemptResult> attemptResultList;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "examAttempts1", fetch = FetchType.LAZY)
//    private List<AttemptResult> attemptResultList1;
//    @OneToMany(cascade = CascadeType.ALL, mappedBy = "examAttempts2", fetch = FetchType.LAZY)
//    private List<AttemptResult> attemptResultList2;

    public ExamAttempts() {
    }

    public ExamAttempts(ExamAttemptsPK examAttemptsPK) {
        this.examAttemptsPK = examAttemptsPK;
    }

    public ExamAttempts(int exam, int user, Date timestamp) {
        this.examAttemptsPK = new ExamAttemptsPK(exam, user, timestamp);
    }

    public ExamAttemptsPK getExamAttemptsPK() {
        return examAttemptsPK;
    }

    public void setExamAttemptsPK(ExamAttemptsPK examAttemptsPK) {
        this.examAttemptsPK = examAttemptsPK;
    }

    public Date getStart() {
        return start;
    }

    public void setStart(Date start) {
        this.start = start;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<AttemptResult> getAttemptResultList() {
        return attemptResultList;
    }

    public void setAttemptResultList(List<AttemptResult> attemptResultList) {
        this.attemptResultList = attemptResultList;
    }


    @Override
    public int hashCode() {
        int hash = 0;
        hash += (examAttemptsPK != null ? examAttemptsPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExamAttempts)) {
            return false;
        }
        ExamAttempts other = (ExamAttempts) object;
        if ((this.examAttemptsPK == null && other.examAttemptsPK != null) || (this.examAttemptsPK != null && !this.examAttemptsPK.equals(other.examAttemptsPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.ExamAttempts[ examAttemptsPK=" + examAttemptsPK + " ]";
    }
    
}
