/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

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
    @Column(name = "exam_id")
    private Integer examId;
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
    private Short assessment;
    @Column(name = "pdfresource")
    private String pdfresource;
    @Column(name = "elearning")
    private String elearning;
    @JoinColumn(name = "category", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Category category;
    @JoinColumn(name = "university", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private University university;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "exam", fetch = FetchType.LAZY)
    private List<ExamAttempts> examAttemptsList;

    public Exam() {
    }

    public Exam(Integer examId) {
        this.examId = examId;
    }

    public Exam(Integer examId, int examYear) {
        this.examId = examId;
        this.examYear = examYear;
    }

    public Integer getExamId() {
        return examId;
    }

    public void setExamId(Integer examId) {
        this.examId = examId;
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

    public Short getAssessment() {
        return assessment;
    }

    public void setAssessment(Short assessment) {
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

    public List<ExamAttempts> getExamAttemptsList() {
        return examAttemptsList;
    }

    public void setExamAttemptsList(List<ExamAttempts> examAttemptsList) {
        this.examAttemptsList = examAttemptsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (examId != null ? examId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Exam)) {
            return false;
        }
        Exam other = (Exam) object;
        if ((this.examId == null && other.examId != null) || (this.examId != null && !this.examId.equals(other.examId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.Exam[ examId=" + examId + " ]";
    }
    
}
