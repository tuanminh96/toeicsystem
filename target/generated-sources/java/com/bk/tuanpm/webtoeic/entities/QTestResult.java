package com.bk.tuanpm.webtoeic.entities;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTestResult is a Querydsl query type for TestResult
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTestResult extends EntityPathBase<TestResult> {

    private static final long serialVersionUID = -1844213271L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTestResult testResult = new QTestResult("testResult");

    public final QExam baithithu;

    public final NumberPath<Integer> correctlisten = createNumber("correctlisten", Integer.class);

    public final NumberPath<Integer> correctreading = createNumber("correctreading", Integer.class);

    public final NumberPath<Integer> ketquaid = createNumber("ketquaid", Integer.class);

    public final DateTimePath<java.util.Date> ngaythi = createDateTime("ngaythi", java.util.Date.class);

    public final QAccount nguoidung;

    public final NumberPath<Integer> rightPart1 = createNumber("rightPart1", Integer.class);

    public final NumberPath<Integer> rightPart2 = createNumber("rightPart2", Integer.class);

    public final NumberPath<Integer> rightPart3 = createNumber("rightPart3", Integer.class);

    public final NumberPath<Integer> rightPart4 = createNumber("rightPart4", Integer.class);

    public final NumberPath<Integer> rightPart5 = createNumber("rightPart5", Integer.class);

    public final NumberPath<Integer> rightPart6 = createNumber("rightPart6", Integer.class);

    public final NumberPath<Integer> rightPart7 = createNumber("rightPart7", Integer.class);

    public final NumberPath<Integer> scoreListen = createNumber("scoreListen", Integer.class);

    public final NumberPath<Integer> scoreReading = createNumber("scoreReading", Integer.class);

    public final NumberPath<Integer> totalTimeTest = createNumber("totalTimeTest", Integer.class);

    public QTestResult(String variable) {
        this(TestResult.class, forVariable(variable), INITS);
    }

    public QTestResult(Path<? extends TestResult> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTestResult(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTestResult(PathMetadata metadata, PathInits inits) {
        this(TestResult.class, metadata, inits);
    }

    public QTestResult(Class<? extends TestResult> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.baithithu = inits.isInitialized("baithithu") ? new QExam(forProperty("baithithu"), inits.get("baithithu")) : null;
        this.nguoidung = inits.isInitialized("nguoidung") ? new QAccount(forProperty("nguoidung"), inits.get("nguoidung")) : null;
    }

}

