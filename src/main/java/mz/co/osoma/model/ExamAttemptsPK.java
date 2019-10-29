/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author user
 */
@Embeddable
public class ExamAttemptsPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "exam")
    private int exam;
    @Basic(optional = false)
    @Column(name = "user")
    private int user;
    @Basic(optional = false)
    @Column(name = "end")
    @Temporal(TemporalType.TIMESTAMP)
    private Date end;

    public ExamAttemptsPK() {
    }

    public ExamAttemptsPK(int exam, int user, Date end) {
        this.exam = exam;
        this.user = user;
        this.end = end;
    }

    public int getExam() {
        return exam;
    }

    public void setExam(int exam) {
        this.exam = exam;
    }

    public int getUser() {
        return user;
    }

    public void setUser(int user) {
        this.user = user;
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(Date end) {
        this.end = end;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) exam;
        hash += (int) user;
        hash += (end != null ? end.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExamAttemptsPK)) {
            return false;
        }
        ExamAttemptsPK other = (ExamAttemptsPK) object;
        if (this.exam != other.exam) {
            return false;
        }
        if (this.user != other.user) {
            return false;
        }
        if ((this.end == null && other.end != null) || (this.end != null && !this.end.equals(other.end))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.ExamAttemptsPK[ exam=" + exam + ", user=" + user + ", end=" + end + " ]";
    }
    
}
