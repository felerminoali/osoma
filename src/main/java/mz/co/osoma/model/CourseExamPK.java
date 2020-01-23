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
public class CourseExamPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "course_id")
    private int courseId;
    @Basic(optional = false)
    @Column(name = "exam_id")
    private int examId;
    @Basic(optional = false)
    @Column(name = "year")
    private int year;

    public CourseExamPK() {
    }

    public CourseExamPK(int courseId, int examId, int year) {
        this.courseId = courseId;
        this.examId = examId;
        this.year = year;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getExamId() {
        return examId;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) courseId;
        hash += (int) examId;
        hash += (int) year;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CourseExamPK)) {
            return false;
        }
        CourseExamPK other = (CourseExamPK) object;
        if (this.courseId != other.courseId) {
            return false;
        }
        if (this.examId != other.examId) {
            return false;
        }
        if (this.year != other.year) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.CourseExamPK[ courseId=" + courseId + ", examId=" + examId + ", year=" + year + " ]";
    }
    
}
