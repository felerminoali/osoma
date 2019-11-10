/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mz.co.osoma.model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * @author user
 */
@Entity
@Table(name = "attempt_result")
@NamedQueries({
        @NamedQuery(name = "AttemptResult.findAll", query = "SELECT a FROM AttemptResult a")})
public class AttemptResult implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @JoinColumns({
            @JoinColumn(name = "exam", referencedColumnName = "exam", nullable = false),
            @JoinColumn(name = "user", referencedColumnName = "user", nullable = false),
            @JoinColumn(name = "timestamp", referencedColumnName = "timestamp", nullable = false)})
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private ExamAttempts examAttempts;
    //
    @JoinColumn(name = "choice", referencedColumnName = "id")
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Choice choice;

    public AttemptResult() {
    }

    public AttemptResult(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ExamAttempts getExamAttempts() {
        return examAttempts;
    }

    public void setExamAttempts(ExamAttempts examAttempts) {
        this.examAttempts = examAttempts;
    }


    public Choice getChoice() {
        return choice;
    }

    public void setChoice(Choice choice) {
        this.choice = choice;
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
        if (!(object instanceof AttemptResult)) {
            return false;
        }
        AttemptResult other = (AttemptResult) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "mz.co.osoma.model.AttemptResult[ id=" + id + " ]";
    }

}
