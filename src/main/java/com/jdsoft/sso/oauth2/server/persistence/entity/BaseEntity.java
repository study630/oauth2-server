package com.jdsoft.sso.oauth2.server.persistence.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@MappedSuperclass
public abstract class BaseEntity implements Serializable {

    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    @GenericGenerator(name = "jpa-uuid", strategy = "uuid")
    @GeneratedValue(generator ="jpa-uuid")
    private String id;

    @Column(name = "record_status", columnDefinition = "int default 0")
    private int recordStatus;

    @Version
    @Column(name = "version", columnDefinition = "int default 0")
    private int version;

    private String remarks;

    @Column(name = "sort_priority", columnDefinition = "int default 0")
    private int sortPriority;

    @Column(columnDefinition = "DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime dateCreated;

    @Column(columnDefinition = "DATETIME DEFAULT CURRENT_TIMESTAMP ON update CURRENT_TIMESTAMP")
    private LocalDateTime lastModified;

    /*
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id_9dsoft;


    public long getId_9dsoft() {
        return id_9dsoft;
    }

    public void setId_9dsoft(long id_9dsoft) {
        this.id_9dsoft = id_9dsoft;
    }
    */
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getRecordStatus() {
        return recordStatus;
    }

    public void setRecordStatus(int recordStatus) {
        this.recordStatus = recordStatus;
    }

    public int getVersion() {
        return version;
    }

    public void setVersion(int version) {
        this.version = version;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public int getSortPriority() {
        return sortPriority;
    }

    public void setSortPriority(int sortPriority) {
        this.sortPriority = sortPriority;
    }

    public LocalDateTime getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(LocalDateTime dateCreated) {
        this.dateCreated = dateCreated;
    }

    public LocalDateTime getLastModified() {
        return lastModified;
    }

    public void setLastModified(LocalDateTime lastModified) {
        this.lastModified = lastModified;
    }

    @PreUpdate
    @PrePersist
    public void updateTimeStamps() {
        lastModified = LocalDateTime.now();
        if (dateCreated == null) {
            dateCreated = LocalDateTime.now();
        }
    }
}
