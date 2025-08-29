import { FunctionComponent } from "react";
import styles from "./FrameComponent.module.css";

export type FrameComponentType = {
  className?: string;
};

const FrameComponent: FunctionComponent<FrameComponentType> = ({
  className = "",
}) => {
  return (
    <section className={[styles.rectangleParent, className].join(" ")}>
      <img className={styles.frameChild} alt="" src="/rectangle-64@2x.png" />
      <div className={styles.frameWrapper}>
        <div className={styles.frameParent}>
          <div className={styles.vectorWrapper}>
            <img
              className={styles.frameItem}
              loading="lazy"
              alt=""
              src="/rectangle-38.svg"
            />
          </div>
          <div className={styles.rectangleGroup}>
            <div className={styles.frameInner} />
            <div className={styles.div}>Подступенник</div>
          </div>
        </div>
      </div>
      <div className={styles.frameGroup}>
        <div className={styles.rectangleContainer}>
          <div className={styles.rectangleDiv} />
          <div className={styles.rectangleParentDiv}>Отбойник</div>
        </div>
        <div className={styles.vectorContainer}>
          <img
            className={styles.rectangleIcon}
            loading="lazy"
            alt=""
            src="/rectangle-38.svg"
          />
        </div>
      </div>
    </section>
  );
};

export default FrameComponent;
