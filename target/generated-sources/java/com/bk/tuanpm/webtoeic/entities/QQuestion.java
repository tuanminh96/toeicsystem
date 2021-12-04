package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QQuestion is a Querydsl query type for Question
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QQuestion extends EntityPathBase<Question> {

    private static final long serialVersionUID = 582410496L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QQuestion question1 = new QQuestion("question1");

    public final StringPath audiomp3 = createString("audiomp3");

    public final QExam baithithu;

    public final NumberPath<Integer> cauhoibaithithuid = createNumber("cauhoibaithithuid", Integer.class);

    public final StringPath correctanswer = createString("correctanswer");

    public final StringPath image = createString("image");

    public final NumberPath<Integer> number = createNumber("number", Integer.class);

    public final StringPath option1 = createString("option1");

    public final StringPath option2 = createString("option2");

    public final StringPath option3 = createString("option3");

    public final StringPath option4 = createString("option4");

    public final StringPath paragraph = createString("paragraph");

    public final QPartToeic partToeic;

    public final StringPath question = createString("question");

    public final QSetQuestion setQuestion;

    public final StringPath updateBy = createString("updateBy");

    public final DatePath<java.sql.Date> updateDate = createDate("updateDate", java.sql.Date.class);

    public QQuestion(String variable) {
        this(Question.class, forVariable(variable), INITS);
    }

    public QQuestion(Path<? extends Question> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QQuestion(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QQuestion(PathMetadata metadata, PathInits inits) {
        this(Question.class, metadata, inits);
    }

    public QQuestion(Class<? extends Question> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.baithithu = inits.isInitialized("baithithu") ? new QExam(forProperty("baithithu"), inits.get("baithithu")) : null;
        this.partToeic = inits.isInitialized("partToeic") ? new QPartToeic(forProperty("partToeic")) : null;
        this.setQuestion = inits.isInitialized("setQuestion") ? new QSetQuestion(forProperty("setQuestion"), inits.get("setQuestion")) : null;
    }

}

