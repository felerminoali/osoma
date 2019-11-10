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
    @Column(name = "timestamp")
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestamp;

    public ExamAttemptsPK() {
    }

    public ExamAttemptsPK(int exam, int user, Date timestamp) {
        this.exam = exam;
        this.user = user;
        this.timestamp = timestamp;
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

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) exam;
        hash += (int) user;
        hash += (timestamp != null ? timestamp.hashCode() : 0);
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
        if ((this.timestamp == null && other.timestamp != null) || (this.timestamp != null && !this.timestamp.equals(other.timestamp))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.ExamAttemptsPK[ exam=" + exam + ", user=" + user + ", timestamp=" + timestamp + " ]";
    }
    
}
