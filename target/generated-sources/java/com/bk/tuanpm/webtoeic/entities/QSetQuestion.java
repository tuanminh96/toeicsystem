package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QSetQuestion is a Querydsl query type for SetQuestion
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QSetQuestion extends EntityPathBase<SetQuestion> {

    private static final long serialVersionUID = -1217534194L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QSetQuestion setQuestion = new QSetQuestion("setQuestion");

    public final StringPath audio = createString("audio");

    public final StringPath content = createString("content");

    public final QExam exam;

    public final NumberPath<Integer> idSet = createNumber("idSet", Integer.class);

    public final StringPath image = createString("image");

    public final StringPath paragraph = createString("paragraph");

    public final QPartToeic partToeic;

    public final NumberPath<Integer> totalQuest = createNumber("totalQuest", Integer.class);

    public final StringPath updateBy = createString("updateBy");

    public final DatePath<java.sql.Date> updateDate = createDate("updateDate", java.sql.Date.class);

    public QSetQuestion(String variable) {
        this(SetQuestion.class, forVariable(variable), INITS);
    }

    public QSetQuestion(Path<? extends SetQuestion> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QSetQuestion(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QSetQuestion(PathMetadata metadata, PathInits inits) {
        this(SetQuestion.class, metadata, inits);
    }

    public QSetQuestion(Class<? extends SetQuestion> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.exam = inits.isInitialized("exam") ? new QExam(forProperty("exam"), inits.get("exam")) : null;
        this.partToeic = inits.isInitialized("partToeic") ? new QPartToeic(forProperty("partToeic")) : null;
    }

}

