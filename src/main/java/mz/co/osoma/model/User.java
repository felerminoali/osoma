/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.persistence.*;

/**
 *
 * @author user
 */
@Entity
@Table(name = "user")
@NamedQueries({
    @NamedQuery(name = "User.findAll", query = "SELECT u FROM User u")})
public class User implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private int id;
    @Basic(optional = false)
    @Column(name = "first_name")
    private String name;
    @Basic(optional = false)
    @Column(name = "last_name")
    private String lastName;
    @Basic(optional = false)
    @Column(name = "email")
    private String email;
    @Basic(optional = false)
    @Column(name = "password")
    private String password;
    @Basic(optional = false)
    @Column(name = "datecreated")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datecreated;
    @Basic(optional = false)
    @Column(name = "active")
    private boolean active;
    @Column(name = "hash")
    private String hash;

    @Basic(optional = false)
    @Column(name = "pin")
    private String pin;

    @Basic(optional = false)
    @Column(name = "contact")
    private String contact;

    @Basic(optional = false)
    @Column(name = "reset_token")
    private String resetToken;



    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "user", fetch = FetchType.LAZY)
    private List<ExamAttempts> examAttemptsList;

    @JsonIgnore
    @OneToMany(mappedBy = "createdby", fetch = FetchType.LAZY)
    private List<Question> questionCreated;

    @JsonIgnore
    @OneToMany(mappedBy = "modifiedby", fetch = FetchType.LAZY)
    private List<Question> questionModified;

    @JsonIgnore
    @JoinColumn(name = "university", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private University university;

    @JsonIgnore
    @JoinColumn(name = "district", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private District district;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;
	

    public User() { }

    public User(User user) {
        this.name = user.getName();
        this.lastName = user.getLastName();
        this.email = user.getEmail();
        this.password = user.getPassword();
        this.datecreated = user.getDatecreated();
        this.active = user.isActive();
        this.hash = user.getHash();
        this.pin = user.getPin();
        this.contact = user.getContact();
        this.resetToken = user.getResetToken();
        this.examAttemptsList = user.getExamAttemptsList();
        this.questionCreated = user.getQuestionCreated();
        this.questionModified = user.getQuestionModified();
        this.university = user.getUniversity();
        this.district = user.getDistrict();
        this.roles = user.getRoles();

    }



    public User(String name, String lastName, String email, String password, Date datecreated, boolean active, String hash, String pin, String contact, String resetToken, List<ExamAttempts> examAttemptsList, List<Question> questionCreated, List<Question> questionModified, University university, District district, Set<Role> roles) {
        this.name = name;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.datecreated = datecreated;
        this.active = active;
        this.hash = hash;
        this.pin = pin;
        this.contact = contact;
        this.resetToken = resetToken;
        this.examAttemptsList = examAttemptsList;
        this.questionCreated = questionCreated;
        this.questionModified = questionModified;
        this.university = university;
        this.district = district;
        this.roles = roles;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getDatecreated() {
        return datecreated;
    }

    public void setDatecreated(Date datecreated) {
        this.datecreated = datecreated;
    }

    public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public boolean isActive() {
        return active;
    }

    public String getResetToken() {
        return resetToken;
    }

    public void setResetToken(String resetToken) {
        this.resetToken = resetToken;
    }

    public List<ExamAttempts> getExamAttemptsList() {
        return examAttemptsList;
    }

    public void setExamAttemptsList(List<ExamAttempts> examAttemptsList) {
        this.examAttemptsList = examAttemptsList;
    }

    public List<Question> getQuestionCreated() {
        return questionCreated;
    }

    public void setQuestionCreated(List<Question> questionCreated) {
        this.questionCreated = questionCreated;
    }

    public List<Question> getQuestionModified() {
        return questionModified;
    }

    public void setQuestionModified(List<Question> questionModified) {
        this.questionModified = questionModified;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    //    public List<UserRole> getUserRoleList() {
//        return userRoleList;
//    }
//
//    public void setUserRoleList(List<UserRole> userRoleList) {
//        this.userRoleList = userRoleList;
//    }

    public University getUniversity() {
        return university;
    }

    public void setUniversity(University university) {
        this.university = university;
    }

    public District getDistrict() {
        return district;
    }

    public void setDistrict(District district) {
        this.district = district;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        Integer ID = new Integer(id);
        hash += (ID != null ? ID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof User)) {
            return false;
        }
        User other = (User) object;
        if ((this.id == 0 && other.id != 0) || (this.id != 0 && !(this.id == other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.User[ id=" + id + " ]";
    }
    
}
