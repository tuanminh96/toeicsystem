package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QRating is a Querydsl query type for Rating
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QRating extends EntityPathBase<Rating> {

    private static final long serialVersionUID = 1334105399L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QRating rating = new QRating("rating");

    public final DateTimePath<java.util.Date> dateReview = createDateTime("dateReview", java.util.Date.class);

    public final QExam exam;

    public final NumberPath<Integer> idRating = createNumber("idRating", Integer.class);

    public final QNguoiDung nguoiDung;

    public final StringPath review = createString("review");

    public final NumberPath<Integer> star = createNumber("star", Integer.class);

    public QRating(String variable) {
        this(Rating.class, forVariable(variable), INITS);
    }

    public QRating(Path<? extends Rating> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QRating(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QRating(PathMetadata metadata, PathInits inits) {
        this(Rating.class, metadata, inits);
    }

    public QRating(Class<? extends Rating> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.exam = inits.isInitialized("exam") ? new QExam(forProperty("exam"), inits.get("exam")) : null;
        this.nguoiDung = inits.isInitialized("nguoiDung") ? new QNguoiDung(forProperty("nguoiDung"), inits.get("nguoiDung")) : null;
    }

}

