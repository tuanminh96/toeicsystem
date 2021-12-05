package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QExam is a Querydsl query type for Exam
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QExam extends EntityPathBase<Exam> {

    private static final long serialVersionUID = -1201210823L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QExam exam = new QExam("exam");

    public final StringPath anhbaithithu = createString("anhbaithithu");

    public final NumberPath<Integer> baithithuid = createNumber("baithithuid", Integer.class);

    public final NumberPath<Integer> countTest = createNumber("countTest", Integer.class);

    public final DatePath<java.sql.Date> dateAdd = createDate("dateAdd", java.sql.Date.class);

    public final StringPath description = createString("description");

    public final StringPath level = createString("level");

    public final StringPath tenbaithithu = createString("tenbaithithu");

    public final StringPath updateBy = createString("updateBy");

    public final DatePath<java.sql.Date> updateDate = createDate("updateDate", java.sql.Date.class);

    public final QAdmin userAdd;

    public QExam(String variable) {
        this(Exam.class, forVariable(variable), INITS);
    }

    public QExam(Path<? extends Exam> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QExam(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QExam(PathMetadata metadata, PathInits inits) {
        this(Exam.class, metadata, inits);
    }

    public QExam(Class<? extends Exam> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.userAdd = inits.isInitialized("userAdd") ? new QAdmin(forProperty("userAdd"), inits.get("userAdd")) : null;
    }

}

