package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QExplainDetail is a Querydsl query type for ExplainDetail
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QExplainDetail extends EntityPathBase<ExplainDetail> {

    private static final long serialVersionUID = 978284366L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QExplainDetail explainDetail = new QExplainDetail("explainDetail");

    public final StringPath explain = createString("explain");

    public final QAdmin idAdmin;

    public final NumberPath<Integer> idExplain = createNumber("idExplain", Integer.class);

    public final QQuestion question;

    public final DatePath<java.sql.Date> updateDate = createDate("updateDate", java.sql.Date.class);

    public QExplainDetail(String variable) {
        this(ExplainDetail.class, forVariable(variable), INITS);
    }

    public QExplainDetail(Path<? extends ExplainDetail> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QExplainDetail(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QExplainDetail(PathMetadata metadata, PathInits inits) {
        this(ExplainDetail.class, metadata, inits);
    }

    public QExplainDetail(Class<? extends ExplainDetail> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.idAdmin = inits.isInitialized("idAdmin") ? new QAdmin(forProperty("idAdmin"), inits.get("idAdmin")) : null;
        this.question = inits.isInitialized("question") ? new QQuestion(forProperty("question"), inits.get("question")) : null;
    }

}

