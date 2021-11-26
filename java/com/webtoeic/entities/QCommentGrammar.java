package com.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;

import com.bk.tuanpm.webtoeic.entities.CommentGrammar;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QCommentGrammar is a Querydsl query type for CommentGrammar
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QCommentGrammar extends EntityPathBase<CommentGrammar> {

    private static final long serialVersionUID = -1594851804L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QCommentGrammar commentGrammar = new QCommentGrammar("commentGrammar");

    public final QBaiGrammar baigrammar;

    public final StringPath cmtgrammarcontent = createString("cmtgrammarcontent");

    public final NumberPath<Integer> cmtgrammarid = createNumber("cmtgrammarid", Integer.class);

    public final DateTimePath<java.util.Date> ngaycomment = createDateTime("ngaycomment", java.util.Date.class);

    public final QNguoiDung nguoidung;

    public QCommentGrammar(String variable) {
        this(CommentGrammar.class, forVariable(variable), INITS);
    }

    public QCommentGrammar(Path<? extends CommentGrammar> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QCommentGrammar(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QCommentGrammar(PathMetadata metadata, PathInits inits) {
        this(CommentGrammar.class, metadata, inits);
    }

    public QCommentGrammar(Class<? extends CommentGrammar> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.baigrammar = inits.isInitialized("baigrammar") ? new QBaiGrammar(forProperty("baigrammar")) : null;
        this.nguoidung = inits.isInitialized("nguoidung") ? new QNguoiDung(forProperty("nguoidung")) : null;
    }

}

