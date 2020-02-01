/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

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
@Table(name = "user_course")
@NamedQueries({
    @NamedQuery(name = "UserCourse.findAll", query = "SELECT u FROM UserCourse u")})
public class UserCourse implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected UserCoursePK userCoursePK;
    @JoinColumn(name = "course_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Course course;

    @JoinColumn(name = "user_id", referencedColumnName = "id", insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private User user;

    public UserCourse() {
    }

    public UserCourse(UserCoursePK userCoursePK) {
        this.userCoursePK = userCoursePK;
    }

    public UserCourse(int userId, int courseId, int year) {
        this.userCoursePK = new UserCoursePK(userId, courseId, year);
    }

    public UserCoursePK getUserCoursePK() {
        return userCoursePK;
    }

    public void setUserCoursePK(UserCoursePK userCoursePK) {
        this.userCoursePK = userCoursePK;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (userCoursePK != null ? userCoursePK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UserCourse)) {
            return false;
        }
        UserCourse other = (UserCourse) object;
        if ((this.userCoursePK == null && other.userCoursePK != null) || (this.userCoursePK != null && !this.userCoursePK.equals(other.userCoursePK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.UserCourse[ userCoursePK=" + userCoursePK + " ]";
    }
    
}
