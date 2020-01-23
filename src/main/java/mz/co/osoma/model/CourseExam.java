/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

import java.io.Serializable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 *
 * @author user
 */
@Entity
@Table(name = "course_exam")
@NamedQueries({
    @NamedQuery(name = "CourseExam.findAll", query = "SELECT c FROM CourseExam c")})
public class CourseExam implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected CourseExamPK courseExamPK;
    @JoinColumn(name = "course_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Course course;
    @JoinColumn(name = "exam_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Exam exam;

    public CourseExam() {
    }

    public CourseExam(CourseExamPK courseExamPK) {
        this.courseExamPK = courseExamPK;
    }

    public CourseExam(int courseId, int examId, int year) {
        this.courseExamPK = new CourseExamPK(courseId, examId, year);
    }

    public CourseExamPK getCourseExamPK() {
        return courseExamPK;
    }

    public void setCourseExamPK(CourseExamPK courseExamPK) {
        this.courseExamPK = courseExamPK;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Exam getExam() {
        return exam;
    }

    public void setExam(Exam exam) {
        this.exam = exam;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (courseExamPK != null ? courseExamPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CourseExam)) {
            return false;
        }
        CourseExam other = (CourseExam) object;
        if ((this.courseExamPK == null && other.courseExamPK != null) || (this.courseExamPK != null && !this.courseExamPK.equals(other.courseExamPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.CourseExam[ courseExamPK=" + courseExamPK + " ]";
    }
    
}
