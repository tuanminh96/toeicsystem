package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QCommentTuVung is a Querydsl query type for CommentTuVung
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QCommentTuVung extends EntityPathBase<CommentTuVung> {

    private static final long serialVersionUID = -5991106L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QCommentTuVung commentTuVung = new QCommentTuVung("commentTuVung");

    public final QBaiTapTuVung baitaptuvung;

    public final StringPath cmtvocabularycontent = createString("cmtvocabularycontent");

    public final NumberPath<Integer> cmtvocabularyid = createNumber("cmtvocabularyid", Integer.class);

    public final DateTimePath<java.util.Date> ngaycomment = createDateTime("ngaycomment", java.util.Date.class);

    public final QNguoiDung nguoidung;

    public QCommentTuVung(String variable) {
        this(CommentTuVung.class, forVariable(variable), INITS);
    }

    public QCommentTuVung(Path<? extends CommentTuVung> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QCommentTuVung(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QCommentTuVung(PathMetadata metadata, PathInits inits) {
        this(CommentTuVung.class, metadata, inits);
    }

    public QCommentTuVung(Class<? extends CommentTuVung> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.baitaptuvung = inits.isInitialized("baitaptuvung") ? new QBaiTapTuVung(forProperty("baitaptuvung")) : null;
        this.nguoidung = inits.isInitialized("nguoidung") ? new QNguoiDung(forProperty("nguoidung"), inits.get("nguoidung")) : null;
    }

}

