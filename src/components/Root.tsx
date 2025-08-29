import { FunctionComponent } from "react";
import FrameComponent from "./FrameComponent";
import styles from "./Root.module.css";

export type RootType = {
  className?: string;
};

const Root: FunctionComponent<RootType> = ({ className = "" }) => {
  return (
    <div className={[styles.root, className].join(" ")}>
      <section className={styles.frameParent}>
        <div className={styles.frameGroup}>
          <div className={styles.rectangleParent}>
            <div className={styles.frameChild} />
            <h3 className={styles.h3}>02</h3>
          </div>
          <div className={styles.wrapper}>
            <h3 className={styles.h32}>Лестницы вашей мечты!</h3>
          </div>
        </div>
        <div className={styles.parent}>
          <h1 className={styles.h1}>
            <p className={styles.p}>{`Отбойник и `}</p>
            <p className={styles.p}>ограждения</p>
          </h1>
          <div className={styles.loremIpsumDolor}>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
            eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim
            ad minim veniam, quis nostrud exercitation ullamco laboris.
          </div>
          <b className={styles.b}>
            <p className={styles.p}>Планка и обойник: 17 398 р.</p>
            <p className={styles.p}>&nbsp;</p>
            <p className={styles.p}>Балясины и перила: 24 600 р.</p>
            <p className={styles.p}>&nbsp;</p>
            <p className={styles.p}>Ступени: 36 200 р.</p>
          </b>
        </div>
      </section>
      <FrameComponent />
    </div>
  );
};

export default Root;
