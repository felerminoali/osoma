/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
@Table(name = "exam")
@NamedQueries({
    @NamedQuery(name = "Exam.findAll", query = "SELECT e FROM Exam e")})
public class Exam implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "exam_year")
    private int examYear;
    @Column(name = "description")
    private String description;
    @Column(name = "duration")
    private Integer duration;
    @Column(name = "noquestion")
    private Integer noquestion;
    @Column(name = "assessment")
    private Boolean assessment;
    @Column(name = "pdfresource")
    private String pdfresource;
    @Column(name = "elearning")
    private String elearning;
    @Column(name = "hassimulation")
    private Boolean hassimulation;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "exam", fetch = FetchType.LAZY)
    @JsonIgnore
    private List<ExamAttempts> examAttemptsList;
    @OneToMany(mappedBy = "exam", fetch = FetchType.LAZY)
    private List<Question> questionList;
    @JoinColumn(name = "category", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JsonIgnore
    private Category category;
    @JoinColumn(name = "university", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JsonIgnore
    private University university;

    public Exam() {
    }

    public Exam(Integer id) {
        this.id = id;
    }

    public Exam(Integer id, int examYear) {
        this.id = id;
        this.examYear = examYear;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getExamYear() {
        return examYear;
    }

    public void setExamYear(int examYear) {
        this.examYear = examYear;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public Integer getNoquestion() {
        return noquestion;
    }

    public void setNoquestion(Integer noquestion) {
        this.noquestion = noquestion;
    }

    public Boolean getAssessment() {
        return assessment;
    }

    public void setAssessment(Boolean assessment) {
        this.assessment = assessment;
    }

    public String getPdfresource() {
        return pdfresource;
    }

    public void setPdfresource(String pdfresource) {
        this.pdfresource = pdfresource;
    }

    public String getElearning() {
        return elearning;
    }

    public void setElearning(String elearning) {
        this.elearning = elearning;
    }

    public Boolean getHassimulation() {
        return hassimulation;
    }

    public void setHassimulation(Boolean hassimulation) {
        this.hassimulation = hassimulation;
    }

    public List<ExamAttempts> getExamAttemptsList() {
        return examAttemptsList;
    }

    public void setExamAttemptsList(List<ExamAttempts> examAttemptsList) {
        this.examAttemptsList = examAttemptsList;
    }

    public List<Question> getQuestionList() {
        return questionList;
    }

    public void setQuestionList(List<Question> questionList) {
        this.questionList = questionList;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public University getUniversity() {
        return university;
    }

    public void setUniversity(University university) {
        this.university = university;
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
        if (!(object instanceof Exam)) {
            return false;
        }
        Exam other = (Exam) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.Exam[ id=" + id + " ]";
    }
    
}
