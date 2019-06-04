/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author user
 */
@Embeddable
public class ExamAttemptsPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "exam_id")
    private int examId;
    @Basic(optional = false)
    @Column(name = "user_id")
    private int userId;

    public ExamAttemptsPK() {
    }

    public ExamAttemptsPK(int examId, int userId) {
        this.examId = examId;
        this.userId = userId;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) examId;
        hash += (int) userId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExamAttemptsPK)) {
            return false;
        }
        ExamAttemptsPK other = (ExamAttemptsPK) object;
        if (this.examId != other.examId) {
            return false;
        }
        if (this.userId != other.userId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.ExamAttemptsPK[ examId=" + examId + ", userId=" + userId + " ]";
    }
    
}
