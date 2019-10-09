/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
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
    @Column(name = "attempt_datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date attemptDatetime;
    @Column(name = "result")
    private Long result;
    @JoinColumn(name = "exam", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Exam exam1;
    @JoinColumn(name = "user", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private User user1;

    public ExamAttempts() {
    }

    public ExamAttempts(ExamAttemptsPK examAttemptsPK) {
        this.examAttemptsPK = examAttemptsPK;
    }

    public ExamAttempts(int exam, int user) {
        this.examAttemptsPK = new ExamAttemptsPK(exam, user);
    }

    public ExamAttemptsPK getExamAttemptsPK() {
        return examAttemptsPK;
    }

    public void setExamAttemptsPK(ExamAttemptsPK examAttemptsPK) {
        this.examAttemptsPK = examAttemptsPK;
    }

    public Date getAttemptDatetime() {
        return attemptDatetime;
    }

    public void setAttemptDatetime(Date attemptDatetime) {
        this.attemptDatetime = attemptDatetime;
    }

    public Long getResult() {
        return result;
    }

    public void setResult(Long result) {
        this.result = result;
    }

    public Exam getExam1() {
        return exam1;
    }

    public void setExam1(Exam exam1) {
        this.exam1 = exam1;
    }

    public User getUser1() {
        return user1;
    }

    public void setUser1(User user1) {
        this.user1 = user1;
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
